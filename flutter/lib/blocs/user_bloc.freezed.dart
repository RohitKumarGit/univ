// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _SigningIn signingIn() {
    return const _SigningIn();
  }

// ignore: unused_element
  _SignedIn signedIn() {
    return const _SignedIn();
  }

// ignore: unused_element
  _SigningOut signingOut() {
    return const _SigningOut();
  }

// ignore: unused_element
  _SignedOut signedOut() {
    return const _SignedOut();
  }
}

/// @nodoc
// ignore: unused_element
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult signingIn(),
    @required TResult signedIn(),
    @required TResult signingOut(),
    @required TResult signedOut(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult signingIn(),
    TResult signedIn(),
    TResult signingOut(),
    TResult signedOut(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult signingIn(_SigningIn value),
    @required TResult signedIn(_SignedIn value),
    @required TResult signingOut(_SigningOut value),
    @required TResult signedOut(_SignedOut value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult signingIn(_SigningIn value),
    TResult signedIn(_SignedIn value),
    TResult signingOut(_SigningOut value),
    TResult signedOut(_SignedOut value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult signingIn(),
    @required TResult signedIn(),
    @required TResult signingOut(),
    @required TResult signedOut(),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult signingIn(),
    TResult signedIn(),
    TResult signingOut(),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult signingIn(_SigningIn value),
    @required TResult signedIn(_SignedIn value),
    @required TResult signingOut(_SigningOut value),
    @required TResult signedOut(_SignedOut value),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult signingIn(_SigningIn value),
    TResult signedIn(_SignedIn value),
    TResult signingOut(_SigningOut value),
    TResult signedOut(_SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$SigningInCopyWith<$Res> {
  factory _$SigningInCopyWith(
          _SigningIn value, $Res Function(_SigningIn) then) =
      __$SigningInCopyWithImpl<$Res>;
}

/// @nodoc
class __$SigningInCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$SigningInCopyWith<$Res> {
  __$SigningInCopyWithImpl(_SigningIn _value, $Res Function(_SigningIn) _then)
      : super(_value, (v) => _then(v as _SigningIn));

  @override
  _SigningIn get _value => super._value as _SigningIn;
}

/// @nodoc
class _$_SigningIn with DiagnosticableTreeMixin implements _SigningIn {
  const _$_SigningIn();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.signingIn()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserState.signingIn'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SigningIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult signingIn(),
    @required TResult signedIn(),
    @required TResult signingOut(),
    @required TResult signedOut(),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return signingIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult signingIn(),
    TResult signedIn(),
    TResult signingOut(),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signingIn != null) {
      return signingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult signingIn(_SigningIn value),
    @required TResult signedIn(_SignedIn value),
    @required TResult signingOut(_SigningOut value),
    @required TResult signedOut(_SignedOut value),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return signingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult signingIn(_SigningIn value),
    TResult signedIn(_SignedIn value),
    TResult signingOut(_SigningOut value),
    TResult signedOut(_SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signingIn != null) {
      return signingIn(this);
    }
    return orElse();
  }
}

abstract class _SigningIn implements UserState {
  const factory _SigningIn() = _$_SigningIn;
}

/// @nodoc
abstract class _$SignedInCopyWith<$Res> {
  factory _$SignedInCopyWith(_SignedIn value, $Res Function(_SignedIn) then) =
      __$SignedInCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignedInCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$SignedInCopyWith<$Res> {
  __$SignedInCopyWithImpl(_SignedIn _value, $Res Function(_SignedIn) _then)
      : super(_value, (v) => _then(v as _SignedIn));

  @override
  _SignedIn get _value => super._value as _SignedIn;
}

/// @nodoc
class _$_SignedIn with DiagnosticableTreeMixin implements _SignedIn {
  const _$_SignedIn();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.signedIn()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserState.signedIn'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult signingIn(),
    @required TResult signedIn(),
    @required TResult signingOut(),
    @required TResult signedOut(),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return signedIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult signingIn(),
    TResult signedIn(),
    TResult signingOut(),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedIn != null) {
      return signedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult signingIn(_SigningIn value),
    @required TResult signedIn(_SignedIn value),
    @required TResult signingOut(_SigningOut value),
    @required TResult signedOut(_SignedOut value),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult signingIn(_SigningIn value),
    TResult signedIn(_SignedIn value),
    TResult signingOut(_SigningOut value),
    TResult signedOut(_SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }
}

abstract class _SignedIn implements UserState {
  const factory _SignedIn() = _$_SignedIn;
}

/// @nodoc
abstract class _$SigningOutCopyWith<$Res> {
  factory _$SigningOutCopyWith(
          _SigningOut value, $Res Function(_SigningOut) then) =
      __$SigningOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$SigningOutCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$SigningOutCopyWith<$Res> {
  __$SigningOutCopyWithImpl(
      _SigningOut _value, $Res Function(_SigningOut) _then)
      : super(_value, (v) => _then(v as _SigningOut));

  @override
  _SigningOut get _value => super._value as _SigningOut;
}

/// @nodoc
class _$_SigningOut with DiagnosticableTreeMixin implements _SigningOut {
  const _$_SigningOut();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.signingOut()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserState.signingOut'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SigningOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult signingIn(),
    @required TResult signedIn(),
    @required TResult signingOut(),
    @required TResult signedOut(),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return signingOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult signingIn(),
    TResult signedIn(),
    TResult signingOut(),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signingOut != null) {
      return signingOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult signingIn(_SigningIn value),
    @required TResult signedIn(_SignedIn value),
    @required TResult signingOut(_SigningOut value),
    @required TResult signedOut(_SignedOut value),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return signingOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult signingIn(_SigningIn value),
    TResult signedIn(_SignedIn value),
    TResult signingOut(_SigningOut value),
    TResult signedOut(_SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signingOut != null) {
      return signingOut(this);
    }
    return orElse();
  }
}

abstract class _SigningOut implements UserState {
  const factory _SigningOut() = _$_SigningOut;
}

/// @nodoc
abstract class _$SignedOutCopyWith<$Res> {
  factory _$SignedOutCopyWith(
          _SignedOut value, $Res Function(_SignedOut) then) =
      __$SignedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignedOutCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$SignedOutCopyWith<$Res> {
  __$SignedOutCopyWithImpl(_SignedOut _value, $Res Function(_SignedOut) _then)
      : super(_value, (v) => _then(v as _SignedOut));

  @override
  _SignedOut get _value => super._value as _SignedOut;
}

/// @nodoc
class _$_SignedOut with DiagnosticableTreeMixin implements _SignedOut {
  const _$_SignedOut();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.signedOut()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserState.signedOut'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult signingIn(),
    @required TResult signedIn(),
    @required TResult signingOut(),
    @required TResult signedOut(),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult signingIn(),
    TResult signedIn(),
    TResult signingOut(),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult signingIn(_SigningIn value),
    @required TResult signedIn(_SignedIn value),
    @required TResult signingOut(_SigningOut value),
    @required TResult signedOut(_SignedOut value),
  }) {
    assert(initial != null);
    assert(signingIn != null);
    assert(signedIn != null);
    assert(signingOut != null);
    assert(signedOut != null);
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult signingIn(_SigningIn value),
    TResult signedIn(_SignedIn value),
    TResult signingOut(_SigningOut value),
    TResult signedOut(_SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class _SignedOut implements UserState {
  const factory _SignedOut() = _$_SignedOut;
}

/// @nodoc
class _$UserEventTearOff {
  const _$UserEventTearOff();

// ignore: unused_element
  _SignIn signIn({@required String firebaseId, @required String email}) {
    return _SignIn(
      firebaseId: firebaseId,
      email: email,
    );
  }

// ignore: unused_element
  _SignOut signOut() {
    return const _SignOut();
  }
}

/// @nodoc
// ignore: unused_element
const $UserEvent = _$UserEventTearOff();

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult signIn(String firebaseId, String email),
    @required TResult signOut(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult signIn(String firebaseId, String email),
    TResult signOut(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult signIn(_SignIn value),
    @required TResult signOut(_SignOut value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult signIn(_SignIn value),
    TResult signOut(_SignOut value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res> implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  final UserEvent _value;
  // ignore: unused_field
  final $Res Function(UserEvent) _then;
}

/// @nodoc
abstract class _$SignInCopyWith<$Res> {
  factory _$SignInCopyWith(_SignIn value, $Res Function(_SignIn) then) =
      __$SignInCopyWithImpl<$Res>;
  $Res call({String firebaseId, String email});
}

/// @nodoc
class __$SignInCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$SignInCopyWith<$Res> {
  __$SignInCopyWithImpl(_SignIn _value, $Res Function(_SignIn) _then)
      : super(_value, (v) => _then(v as _SignIn));

  @override
  _SignIn get _value => super._value as _SignIn;

  @override
  $Res call({
    Object firebaseId = freezed,
    Object email = freezed,
  }) {
    return _then(_SignIn(
      firebaseId:
          firebaseId == freezed ? _value.firebaseId : firebaseId as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
class _$_SignIn with DiagnosticableTreeMixin implements _SignIn {
  const _$_SignIn({@required this.firebaseId, @required this.email})
      : assert(firebaseId != null),
        assert(email != null);

  @override
  final String firebaseId;
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.signIn(firebaseId: $firebaseId, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.signIn'))
      ..add(DiagnosticsProperty('firebaseId', firebaseId))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignIn &&
            (identical(other.firebaseId, firebaseId) ||
                const DeepCollectionEquality()
                    .equals(other.firebaseId, firebaseId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firebaseId) ^
      const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$SignInCopyWith<_SignIn> get copyWith =>
      __$SignInCopyWithImpl<_SignIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult signIn(String firebaseId, String email),
    @required TResult signOut(),
  }) {
    assert(signIn != null);
    assert(signOut != null);
    return signIn(firebaseId, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult signIn(String firebaseId, String email),
    TResult signOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signIn != null) {
      return signIn(firebaseId, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult signIn(_SignIn value),
    @required TResult signOut(_SignOut value),
  }) {
    assert(signIn != null);
    assert(signOut != null);
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult signIn(_SignIn value),
    TResult signOut(_SignOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _SignIn implements UserEvent {
  const factory _SignIn({@required String firebaseId, @required String email}) =
      _$_SignIn;

  String get firebaseId;
  String get email;
  @JsonKey(ignore: true)
  _$SignInCopyWith<_SignIn> get copyWith;
}

/// @nodoc
abstract class _$SignOutCopyWith<$Res> {
  factory _$SignOutCopyWith(_SignOut value, $Res Function(_SignOut) then) =
      __$SignOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignOutCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$SignOutCopyWith<$Res> {
  __$SignOutCopyWithImpl(_SignOut _value, $Res Function(_SignOut) _then)
      : super(_value, (v) => _then(v as _SignOut));

  @override
  _SignOut get _value => super._value as _SignOut;
}

/// @nodoc
class _$_SignOut with DiagnosticableTreeMixin implements _SignOut {
  const _$_SignOut();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.signOut()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserEvent.signOut'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult signIn(String firebaseId, String email),
    @required TResult signOut(),
  }) {
    assert(signIn != null);
    assert(signOut != null);
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult signIn(String firebaseId, String email),
    TResult signOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult signIn(_SignIn value),
    @required TResult signOut(_SignOut value),
  }) {
    assert(signIn != null);
    assert(signOut != null);
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult signIn(_SignIn value),
    TResult signOut(_SignOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SignOut implements UserEvent {
  const factory _SignOut() = _$_SignOut;
}
