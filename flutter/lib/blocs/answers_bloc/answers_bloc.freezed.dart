// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'answers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AnswersStateTearOff {
  const _$AnswersStateTearOff();

// ignore: unused_element
  _Initial initial(List<Answer> answers) {
    return _Initial(
      answers,
    );
  }

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }
}

/// @nodoc
// ignore: unused_element
const $AnswersState = _$AnswersStateTearOff();

/// @nodoc
mixin _$AnswersState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(List<Answer> answers),
    @required TResult loading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(List<Answer> answers),
    TResult loading(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AnswersStateCopyWith<$Res> {
  factory $AnswersStateCopyWith(
          AnswersState value, $Res Function(AnswersState) then) =
      _$AnswersStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnswersStateCopyWithImpl<$Res> implements $AnswersStateCopyWith<$Res> {
  _$AnswersStateCopyWithImpl(this._value, this._then);

  final AnswersState _value;
  // ignore: unused_field
  final $Res Function(AnswersState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  $Res call({List<Answer> answers});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AnswersStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object answers = freezed,
  }) {
    return _then(_Initial(
      answers == freezed ? _value.answers : answers as List<Answer>,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(this.answers) : assert(answers != null);

  @override
  final List<Answer> answers;

  @override
  String toString() {
    return 'AnswersState.initial(answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(other.answers, answers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(answers);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(List<Answer> answers),
    @required TResult loading(),
  }) {
    assert(initial != null);
    assert(loading != null);
    return initial(answers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(List<Answer> answers),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(answers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
  }) {
    assert(initial != null);
    assert(loading != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AnswersState {
  const factory _Initial(List<Answer> answers) = _$_Initial;

  List<Answer> get answers;
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$AnswersStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AnswersState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(List<Answer> answers),
    @required TResult loading(),
  }) {
    assert(initial != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(List<Answer> answers),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
  }) {
    assert(initial != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AnswersState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
class _$AnswersEventTearOff {
  const _$AnswersEventTearOff();

// ignore: unused_element
  _Fetch fetch() {
    return const _Fetch();
  }

// ignore: unused_element
  _Post post({@required String answer}) {
    return _Post(
      answer: answer,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AnswersEvent = _$AnswersEventTearOff();

/// @nodoc
mixin _$AnswersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetch(),
    @required TResult post(String answer),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetch(),
    TResult post(String answer),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetch(_Fetch value),
    @required TResult post(_Post value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetch(_Fetch value),
    TResult post(_Post value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AnswersEventCopyWith<$Res> {
  factory $AnswersEventCopyWith(
          AnswersEvent value, $Res Function(AnswersEvent) then) =
      _$AnswersEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnswersEventCopyWithImpl<$Res> implements $AnswersEventCopyWith<$Res> {
  _$AnswersEventCopyWithImpl(this._value, this._then);

  final AnswersEvent _value;
  // ignore: unused_field
  final $Res Function(AnswersEvent) _then;
}

/// @nodoc
abstract class _$FetchCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) then) =
      __$FetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchCopyWithImpl<$Res> extends _$AnswersEventCopyWithImpl<$Res>
    implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(_Fetch _value, $Res Function(_Fetch) _then)
      : super(_value, (v) => _then(v as _Fetch));

  @override
  _Fetch get _value => super._value as _Fetch;
}

/// @nodoc
class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'AnswersEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetch(),
    @required TResult post(String answer),
  }) {
    assert(fetch != null);
    assert(post != null);
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetch(),
    TResult post(String answer),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetch(_Fetch value),
    @required TResult post(_Post value),
  }) {
    assert(fetch != null);
    assert(post != null);
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetch(_Fetch value),
    TResult post(_Post value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements AnswersEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
abstract class _$PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  $Res call({String answer});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$AnswersEventCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object answer = freezed,
  }) {
    return _then(_Post(
      answer: answer == freezed ? _value.answer : answer as String,
    ));
  }
}

/// @nodoc
class _$_Post implements _Post {
  const _$_Post({@required this.answer}) : assert(answer != null);

  @override
  final String answer;

  @override
  String toString() {
    return 'AnswersEvent.post(answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(answer);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetch(),
    @required TResult post(String answer),
  }) {
    assert(fetch != null);
    assert(post != null);
    return post(answer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetch(),
    TResult post(String answer),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (post != null) {
      return post(answer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetch(_Fetch value),
    @required TResult post(_Post value),
  }) {
    assert(fetch != null);
    assert(post != null);
    return post(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetch(_Fetch value),
    TResult post(_Post value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (post != null) {
      return post(this);
    }
    return orElse();
  }
}

abstract class _Post implements AnswersEvent {
  const factory _Post({@required String answer}) = _$_Post;

  String get answer;
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith;
}
