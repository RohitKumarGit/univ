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
        ),
    ];
  }

  var teachingSessions = <TeachingSession>[];

  Future<List<TeachingSession>> fetchTeachingSessions() async {
    await Future.delayed(const Duration(seconds: 2));
    return teachingSessions = [
      for (var i = 0; i < 10; ++i)
        TeachingSession(
          title: 'Good title legal definition of good title',
          link: 'some-link',
          ratings: 5,
          tags: ['flutter', 'react', 'android', 'ruby'],
          dateTime: DateTime.now(),
          maxAttendees: 10,
          done: true,
          cancelled: false,
          credits: i,
          student: 'Navaneeth',
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

  var answers = <Answer>[];

  Future<List<Answer>> fetchAnswers() async {
    await Future.delayed(Duration(seconds: 0));
    return answers = [
    Answer(
      date: DateTime.now(),
      accepted: false,
      id: '1',
      name: 'Navaneeth',
      answer: '''(This should've been a comment but there is no formatting)

Use trailing commas in the arguments list.


Without trailing commas:
```
Foo(arg1: ..., arg2: ...)
```


With trailing commas:
```
Foo(
  arg1: ...,
  arg2: ..., // notice the comma
)
```

for eg.:
```
decoration: BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/\$bgImage'), 
    fit: BoxFit.cover, // add a comma here
  ), // add a comma here
),
```''',
    ),
    Answer(
      date: DateTime.now(),
      accepted: true,
      id: '1',
      name: 'Navaneeth',
      answer: '''After deletion `DropdownButton` is given a `value`(`selectedStand`) that none of the `DropdownMenuItem`s contain. So, first check if a document exists whose `id` is `selectedStand` otherwise set `value` to `null`.

```
// get the document with id as selectedStand. Will be null if it doesn't exist.
var selectedDoc = snapshot.data.documents.firstWhere(
  (doc) => doc.documentID == selectedStand,
  orElse: () => null,
);

DropdownButton(
  // assign selectedDoc's id (same as selectedStand) if exists
  // otherwise null
  value = selectedDoc?.documentID,
  // ...
),
```

The logic should not be in `onChanged` but outside of `DropdownButton` within the `StreamBuilder`.

```
selectedDoc = snapshot.data.documents.firstWhere(
  (doc) => doc.documentID == selectedStand,
  orElse: () => null,
);

return Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    DropdownButton(
      items: standItems,
      onChanged: (standValue) {
         setState(() {
         selectedStand = standValue;
        });
      },
      value: selectedDoc?.documentID,
      isExpanded: false,
      hint: new Text(
        "Choose stand to delete"
      ),
   ),
  ],
),
```

Alternatively you could set `selectedStand = selectedDoc?.documentID` right after finding `selectedDoc`, so that `selectedStand` will always have a valid value.''',
    ),
    Answer(
      date: DateTime.now(),
      accepted: false,
      id: '1',
      name: 'Navaneeth',
      answer: '''Something was changed ,i.e, added, removed, modified

```
if (snapshot.data.documentChanges.length != 0) {
  // Some changes were made. Show Indicator
}
```''',
    ),
  ];
  }
}
