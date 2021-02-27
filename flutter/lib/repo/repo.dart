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

  var sessions = <Session>[];

  Future<List<Session>> fetchSessions() async {
    await Future.delayed(const Duration(seconds: 2));
    return sessions = [
      for (var i = 0; i < 10; ++i)
        Session(
          title: 'Good title legal definition of good title',
          link: 'some-link',
          ratings: 5,
          tags: ['flutter', 'react', 'android', 'ruby'],
          dateTime: DateTime.now(),
          maxAttendees: 10,
          done: true,
          cancelled: false,
          credits: i,
        ),
    ];
  }

  var questions = <Question>[];

  Future<List<Question>> fetchQuestions() async {
    await Future.delayed(const Duration(seconds: 2));
    return questions = [
      for (var i = 0; i < 10; ++i)
        Question(
        voted: i % 4 == 0 ? true : (i % 6 == 0 ? false : null),
        id: '1',
        isAnswered: i % 3 == 0,
        name: 'Navaneeth',
        votes: 127,
        date: DateTime(2021, 1, 25),
        title: 'Show a text just a view seconds Flutter?',
        description:
            'I got an on pressed **method** that *shows* a message `if` something is wrong it displayed an error message and if not it displayed another message. My Problem is that when user enters something wrong and then trying again and enters something right it shows the error message still and also the other message.',
        answers: 0,
      ),
    ];
  }
}
