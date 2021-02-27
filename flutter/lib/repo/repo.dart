import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/models.dart';

// TODO: rewrite after server is build.

class Repo {
  User _user;
  User get user => _user;

  bool get hasUser => _user != null;

  Future<void> postAnswer(String answer) async {
    //TODO: send name in post
    http.post(
      Uri.parse('https://hackverse.herokuapp.com/api/QNA/question'),
      body: jsonEncode({}),
    );
  }

  Future<bool> postQuestion({
    String title,
    String description,
    List<String> tags,
  }) async {
    final body = jsonEncode({
      'title': title,
      'desc': description,
      'univ': user.univId,
      'student': user.studentId,
      'tags': tags,
    });

    final response = await http.post(
      'https://hackverse.herokuapp.com/api/QNA/question',
      headers: {
        'content-type': 'application/json',
        'Content-Length': body.length.toString(),
      },
      body: body,
    );

    if (response.statusCode != 200) {
      return false;
    }

    return true;
  }

  Future<User> signIn() async {
    await Future.delayed(const Duration(seconds: 2));
    return _user = User(
      credits: 100,
      email: 'navaneethp123@outlook.com',
      name: 'Navaneeth P',
      studentId: '603a9c6e6a47357880ab74b5',
      univId: '603a5e7bb74ddd2918e7001f',
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
    final response = await http.get(
      'https://hackverse.herokuapp.com/api/QNA/?univ_id=${user.univId}'
    );

    if (response.statusCode != 200) {
      return null;
    }

    final jsonData = jsonDecode(response.body);
    final qs = <Question>[];

    print(jsonData);

    // for (final jd in jsonData['questions']) {
    //   final upVotes = jd['upvote'] as List;
    //   final downVotes = jd['downvote'] as List;
    //   final votes = upVotes.length - downVotes.length;
    //   bool voted;
    //   if (upVotes.contains(user.studentId)) {
    //     voted = true;
    //   } else if (downVotes.contains(user.studentId)) {
    //     voted = false;
    //   } else {
    //     voted = null;
    //   }
    //   qs.add(Question(
    //     isAnswered: jd['answered'],
    //     votes: votes,
    //     voted: voted,
    //     answersList: jd['answers'].map<Answer>((ad) {
    //       return Answer(
    //         answer: ad['description'],
    //         date: DateTime.parse(ad['updatedAt']),
    //         accepted: ad['awarded'],
    //         name: ad['name'],
    //         id: ad['_id'],
    //       );
    //     }).toList(),
    //     id: jd['_id'],
    //     date: DateTime.parse(jd['updatedAt']),
    //     description: jd['desc'],
    //     title: jd['title'],
    //     uid: jd['student']['_id'],
    //     name: jd['student']['name'],
    //     tags: jd['tags']
    //   ));
    // }
    
    // return questions = qs;
    return questions;
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
        answer:
            '''After deletion `DropdownButton` is given a `value`(`selectedStand`) that none of the `DropdownMenuItem`s contain. So, first check if a document exists whose `id` is `selectedStand` otherwise set `value` to `null`.

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
