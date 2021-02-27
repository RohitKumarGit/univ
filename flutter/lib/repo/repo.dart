import '../models/models.dart';

// TODO: rewrite after server is build.

class Repo {
  User _user;
  User get user => _user;

  bool get hasUser => _user != null;

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

  var notes = <Note>[];

  Future<List<Note>> fetchNotes() async {
    await Future.delayed(const Duration(seconds: 2));
    return notes = [
      for (var i = 0; i < 10; ++i)
        Note(
          id: '$i',
          title: 'Good title legal definition of good title',
          description:
              'n. ownership of real property which is totally free of claims against it and therefore can be sold, transferred, or put up as security (placing a mortgage or deed of trust on the property).',
          thumbnailLink:
              'https://designartlovestory.files.wordpress.com/2011/04/davinci-note-book.jpg',
          pdfLink: 'some-link',
          tags: ['flutter', 'react', 'android', 'ruby'],
        ),
    ];
  }
}
