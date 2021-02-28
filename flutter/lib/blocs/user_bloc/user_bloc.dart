import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

import '../../repo/repo.dart';
part 'user_bloc.freezed.dart';

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

  final _fa = FirebaseAuth.instance;

  @override
  Stream<UserState> mapEventToState(UserEvent event) {
    return event.map(
      signIn: _signIn,
      signOut: _signOut,
    );
  }

  Stream<UserState> _signIn(_SignIn event) async* {
    yield const UserState.signingIn();

    try {
      final cred = await _fa.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      final user = await _repo.signIn(cred.user.email);
      if (user != null) {
        print('signedIn');
        yield const UserState.signedIn();
      } else {
        yield const UserState.initial();
      }
    } catch (_) {
      yield const UserState.initial();
    }
  }

  Stream<UserState> _signOut(_SignOut event) async* {
    yield const UserState.signingOut();
    await _repo.signOut();
    yield const UserState.signedOut();
  }
}
