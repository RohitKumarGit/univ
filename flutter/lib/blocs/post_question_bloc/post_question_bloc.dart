import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/models.dart';
import '../../repo/repo.dart';

part 'post_question_bloc.freezed.dart';

@freezed
abstract class PostQuestionState with _$PostQuestionState {
  const factory PostQuestionState.posting() = _Posting;
  const factory PostQuestionState.initial() = _Initial;
  const factory PostQuestionState.posted() = _Posted;
}

@freezed
abstract class PostQuestionEvent with _$PostQuestionEvent {
  const factory PostQuestionEvent.post({
    String title,
    String description,
    List<String> tags,
  }) = _Post;
}

class PostQuestionBloc extends Bloc<PostQuestionEvent, PostQuestionState> {
  PostQuestionBloc({
    this.question,
    this.repo,
  }) : super(const PostQuestionState.initial());

  final Question question;
  final Repo repo;

  @override
  Stream<PostQuestionState> mapEventToState(PostQuestionEvent event) {
    return event.map(post: _post);
  }

  Stream<PostQuestionState> _post(_Post event) async* {
    yield const PostQuestionState.posting();
    try {
      final posted = await repo.postQuestion(
        title: event.title,
        description: event.description,
        tags: event.tags,
      );
      if (posted) {
        yield const PostQuestionState.posted();
      }
    } catch (_) {
      yield const PostQuestionState.initial();
    }
  }
}
