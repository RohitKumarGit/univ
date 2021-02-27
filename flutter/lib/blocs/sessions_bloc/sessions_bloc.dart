import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repo/repo.dart';
part 'sessions_bloc.freezed.dart';

// TODO: do error handling

@freezed
abstract class SessionsState with _$SessionsState {
  const factory SessionsState.initial() = _Initial;
  const factory SessionsState.loading() = _Loading;
  const factory SessionsState.refreshing() = _Refreshing;
}

@freezed
abstract class SessionsEvent with _$SessionsEvent {
  const factory SessionsEvent.fetch() = _Fetch;
  const factory SessionsEvent.refresh(Completer<void> completer) = _Refresh;
}

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {
  SessionsBloc({
    @required Repo repo,
  })  : assert(repo != null),
        _repo = repo,
        super(const SessionsState.initial());

  final Repo _repo;

  @override
  Stream<SessionsState> mapEventToState(SessionsEvent event) {
    return event.map(
      fetch: _fetch,
      refresh: _refresh,
    );
  }

  Stream<SessionsState> _fetch(_Fetch event) async* {
    yield const SessionsState.loading();
    await _repo.fetchSessions();
    yield const SessionsState.initial();
  }

  Stream<SessionsState> _refresh(_Refresh event) async* {
    yield const SessionsState.refreshing();
    await _repo.fetchSessions();
    event.completer.complete();
    yield const SessionsState.initial();
  } 
}
