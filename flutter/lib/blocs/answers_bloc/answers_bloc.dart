import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/models.dart';
import '../../repo/repo.dart';

part 'answers_bloc.freezed.dart';

@freezed
abstract class AnswersState with _$AnswersState {
  const factory AnswersState.initial(List<Answer> answers) = _Initial;
  const factory AnswersState.loading() = _Loading;
}

@freezed
abstract class AnswersEvent with _$AnswersEvent {
  const factory AnswersEvent.fetch() = _Fetch;
}

class AnswersBloc extends Bloc<AnswersEvent, AnswersState> {
  AnswersBloc({
    @required Repo repo,
    @required Question question,
  })  : assert(repo != null),
        assert(question != null),
        _repo = repo,
        _question = question,
        super(const AnswersState.initial([]));

  final Repo _repo;
  final Question _question;

  @override
  Stream<AnswersState> mapEventToState(AnswersEvent event) {
    return event.map(
      fetch: _fetch,
    );
  }

  Stream<AnswersState> _fetch(_Fetch event) async* {
    yield const AnswersState.loading();
    final answers = await _repo.fetchAnswers();
    yield AnswersState.initial(answers);
  }
}
