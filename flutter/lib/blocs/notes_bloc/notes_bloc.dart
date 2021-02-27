import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repo/repo.dart';
part 'notes_bloc.freezed.dart';

// TODO: do error handling

@freezed
abstract class NotesState with _$NotesState {
  const factory NotesState.initial() = _Initial;
  const factory NotesState.loading() = _Loading;
  const factory NotesState.refreshing() = _Refreshing;
}

@freezed
abstract class NotesEvent with _$NotesEvent {
  const factory NotesEvent.fetch() = _Fetch;
  const factory NotesEvent.refresh(Completer<void> completer) = _Refresh;
}

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc({
    @required Repo repo,
  })  : assert(repo != null),
        _repo = repo,
        super(const NotesState.initial());

  final Repo _repo;

  @override
  Stream<NotesState> mapEventToState(NotesEvent event) {
    return event.map(
      fetch: _fetch,
      refresh: _refresh,
    );
  }

  Stream<NotesState> _fetch(_Fetch event) async* {
    yield const NotesState.loading();
    await _repo.fetchNotes();
    yield const NotesState.initial();
  }

  Stream<NotesState> _refresh(_Refresh event) async* {
    yield const NotesState.refreshing();
    await _repo.fetchNotes();
    event.completer.complete();
    yield const NotesState.initial();
  } 
}
