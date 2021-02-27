import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/models.dart';
import '../../repo/repo.dart';

part 'post_answer_bloc.freezed.dart';

@freezed 
abstract class PostAnswerState with _$PostAnswerState {
  const factory PostAnswerState.posting() = _Posting;
  const factory PostAnswerState.initial() = _Initial;
  const factory PostAnswerState.posted() = _Posted;
}

@freezed 
abstract class PostAnswerEvent with _$PostAnswerEvent {
  const factory PostAnswerEvent.post({String answer, String qId}) = _Post;
}

class PostAnswerBloc extends Bloc<PostAnswerEvent, PostAnswerState> {
  PostAnswerBloc({this.question, this.repo,}) : super(const PostAnswerState.initial());

  final Question question;
  final Repo repo;

  @override
  Stream<PostAnswerState> mapEventToState(PostAnswerEvent event) {
    return event.map(post: _post);
  }

  Stream<PostAnswerState> _post(_Post event) async* {
    yield const PostAnswerState.posting();
    await repo.postAnswer(event.answer, event.qId);
      yield const PostAnswerState.posted();
  }
}