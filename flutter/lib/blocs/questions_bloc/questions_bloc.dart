import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repo/repo.dart';
part 'questions_bloc.freezed.dart';

// TODO: do error handling

@freezed
abstract class QuestionsState with _$QuestionsState {
  const factory QuestionsState.initial() = _Initial;
  const factory QuestionsState.loading() = _Loading;
  const factory QuestionsState.refreshing() = _Refreshing;
}

@freezed
abstract class QuestionsEvent with _$QuestionsEvent {
  const factory QuestionsEvent.fetch() = _Fetch;
  const factory QuestionsEvent.refresh(Completer<void> completer) = _Refresh;
}

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc({
    @required Repo repo,
  })  : assert(repo != null),
        _repo = repo,
        super(const QuestionsState.initial());

  final Repo _repo;

  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) {
    return event.map(
      fetch: _fetch,
      refresh: _refresh,
    );
  }

  Stream<QuestionsState> _fetch(_Fetch event) async* {
    yield const QuestionsState.loading();
    await _repo.fetchQuestions();
    yield const QuestionsState.initial();
  }

  Stream<QuestionsState> _refresh(_Refresh event) async* {
    yield const QuestionsState.refreshing();
    await _repo.fetchQuestions();
    event.completer.complete();
    yield const QuestionsState.initial();
  } 
}
