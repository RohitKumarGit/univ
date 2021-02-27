import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repo/repo.dart';
part '../user_bloc.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.signingIn() = _SigningIn;
  const factory UserState.signedIn() = _SignedIn;
  const factory UserState.signingOut() = _SigningOut;
  const factory UserState.signedOut() = _SignedOut;
}

@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.signIn({
    @required String password,
    @required String email,
  }) = _SignIn;
  const factory UserEvent.signOut() = _SignOut;
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({@required Repo repo})
      : assert(repo != null),
        _repo = repo,
        super(const UserState.initial());

  final Repo _repo;

  @override
  Stream<UserState> mapEventToState(UserEvent event) {
    return event.map(
      signIn: _signIn,
      signOut: _signOut,
    );
  }

  Stream<UserState> _signIn(_SignIn event) async* {
    yield const UserState.signingIn();
    await _repo.signIn();
    yield const UserState.signedIn();
  }

  Stream<UserState> _signOut(_SignOut event) async* {
    yield const UserState.signingOut();
    await _repo.signOut();
    yield const UserState.signedOut();
  }
}
