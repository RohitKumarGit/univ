import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/models.dart';

// TODO: rewrite after server is build.

class Repo {
  User _user;
  User get user => _user;

  bool get hasUser => _user != null;

  Future<void> postAnswer(String answer, String qId) async {
    final body = jsonEncode({
      'question_id': qId,
      'answer': {
        'desc': answer,
        'univ': user.univId,
        'student': user.studentId,
        'name': user.name,
      },
    });

    final response = await http.post(
      'https://hackverse.herokuapp.com/api/QNA/answer',
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

  Future<User> signIn(String email) async {
    if (email == null) {
      print('null email');
      return null;
    }

    final response = await http.get(
        'https://hackverse.herokuapp.com/api/student/verify/?email=${email}');

    print(response.statusCode);
    print(response.body);

    print('lol0');
    if (response.statusCode != 200) {
      print('returning here1');
      return null;
    }
    print('lol1');

    final d = jsonDecode(response.body);

    print('lol2');
    if (d['isNew'] ?? true) {
      print('returning here');
      return null;
    }
    print('lol3');

    final ud = d['student'][2];

    try {
      _user = User(
        credits: ud['credits'] as int,
        name: ud['name'],
        email: ud['email'],
        studentId: ud['_id'],
        univId: ud['univ']['_id'],
      );
    } catch (_, __) {
      print(_);
      print(__);
      throw _;
    }

    print('here3');

    return _user;
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    return _user = null;
  }

  var notes = <Note>[];

  Future<List<Note>> fetchNotes() async {
    await Future.delayed(const Duration(seconds: 2));
    return notes = [
      Note(
        id: '1',
        title: 'DBMS Second sem.',
        description: 'Covers all chapters with diagram. Follows the college curricullum.',
        thumbnailLink: 'https://d3pbdh1dmixop.cloudfront.net/pdfexpert/Blog/how-to-take-notes-on-ipad/2.jpeg',
        pdfLink: 'some-link',
        tags: ['dbms'],
      ),
      Note(
        id: '2',
        title: 'Fast Forier Transform',
        description: 'Detailed explanation with graphs and waves.',
        thumbnailLink: 'https://lecturenotes.in/uploads/upload/5b39/5b39dd/5b39dd788c8e692c933ea462/cjj3zfu6q069d0pquz6cgdfyr.jpg',
        pdfLink: 'some-link',
        tags: ['math', 'fourier'],
      ),
    ];
  }

  var sessions = <Session>[];

  Future<List<Session>> fetchSessions() async {
    await Future.delayed(const Duration(seconds: 2));
    return sessions = [
      Session(
        title: 'Machine learning in modern era!',
        link: 'some-link',
        ratings: 5,
        tags: ['ml', 'ai'],
        dateTime: DateTime(2021, 3, 7),
        maxAttendees: 10,
        done: true,
        cancelled: false,
      ),
      Session(
        title: 'Web development vs Data science',
        link: 'some-link',
        ratings: 5,
        tags: ['ml', 'web'],
        dateTime: DateTime(2021, 3, 10),
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
      TeachingSession(
        title: 'What\'s the fourier transfor of sin(x/2)?',
        link: 'some-link',
        ratings: 5,
        tags: ['math', 'waves'],
        dateTime: DateTime(2021, 3, 2),
        maxAttendees: 10,
        done: true,
        cancelled: false,
        credits: 4,
        student: 'Navaneeth',
      ),
      TeachingSession(
        title: 'What is signum(x)?',
        link: 'some-link',
        ratings: 5,
        tags: ['math', 'waves'],
        dateTime: DateTime(2021, 3, 6),
        maxAttendees: 10,
        done: true,
        cancelled: false,
        credits: 4,
        student: 'Rohit',
      ),
      TeachingSession(
        title: 'What is deadlock in process synchronization?',
        link: 'some-link',
        ratings: 5,
        tags: ['os', 'hardware'],
        dateTime: DateTime(2021, 3, 12),
        maxAttendees: 10,
        done: true,
        cancelled: false,
        credits: 2,
        student: 'Devansi',
      ),
    ];
  }

  var questions = <Question>[];

  Future<List<Question>> fetchQuestions() async {
    final response = await http
        .get('https://hackverse.herokuapp.com/api/QNA/?univ_id=${user.univId}');

    if (response.statusCode != 200) {
      return null;
    }

    final jsonData = jsonDecode(response.body);

    print(jsonData);

    final qs = <Question>[];

    for (final jd in jsonData['questions']) {
      final upVotes = jd['upvote'] as List;
      final downVotes = jd['downvote'] as List;
      final votes = upVotes.length - downVotes.length;
      bool voted;
      if (upVotes.contains(user.studentId)) {
        voted = true;
      } else if (downVotes.contains(user.studentId)) {
        voted = false;
      } else {
        voted = null;
      }
      qs.add(Question(
        isAnswered: jd['answered'],
        votes: votes,
        voted: voted,
        answersList: jd['answers'].map<Answer>((ad) {
          return Answer(
            answer: ad['desc'],
            date: DateTime.parse(ad['updatedAt']),
            accepted: ad['awarded'] ?? false,
            name: ad['name'],
            id: ad['_id'],
            student: ad['student'],
          );
        }).toList(),
        id: jd['_id'],
        date: DateTime.parse(jd['updatedAt']),
        description: jd['desc'],
        title: jd['title'],
        uid: jd['student']['_id'],
        name: jd['student']['name'],
        tags: jd['tags'].cast<String>(),
      ));
    }

    print(qs);

    questions = qs;
    return questions;
  }

  var answers = <Answer>[];

  Future<List<Answer>> fetchAnswers() async {
    await Future.delayed(Duration(seconds: 0));
    return answers = [];
  }
}
