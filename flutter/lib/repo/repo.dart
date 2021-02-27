import '../models/models.dart';

// TODO: rewrite after server is build.

class Repo {
  User _user;
  User get user => _user;

  Future<User> signIn() async {
    await Future.delayed(const Duration(seconds: 2));
    return _user = User(
      email: 'navaneethp123@outlook.com',
      name: 'Navaneeth P',
      uid: 'unique_user_id',
    );
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    return _user = null;
  }
}