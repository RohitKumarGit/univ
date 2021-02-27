import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../repo/repo.dart';

class AnswersList extends StatelessWidget {
  const AnswersList(this.q);

  final Question q;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswersBloc, AnswersState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          ),
          initial: (state) {
            final answers = q.answersList;
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: answers.length,
              itemBuilder: (context, i) {
                return AnswerTile(a: answers[i], q: q);
              },
            );
          },
        );
      },
    );
  }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile({this.a, this.q});

  final Answer a;
  final Question q;

  static final _df = DateFormat.yMMMd();
  static final _tf = DateFormat.jm();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${a.name} • ${_df.format(a.date)} ${_tf.format(a.date)}',
              style: TextStyle(
                color: a.accepted ? Colors.green : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: MarkdownBody(data: a.answer),
            ),
            Consumer<Repo>(builder: (context, repo, _) {
              final isAnswered = q.answersList.firstWhere(
                (a) => a.accepted,
                orElse: () => null,
              );
              if (!(isAnswered ?? false) && repo.hasUser && repo.user.studentId == q.uid) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () async {
                      final body = jsonEncode({
                          'aid': a.id,
                          'student': a.student,
                          'aid1': context.read<Repo>().user.studentId,
                        });
                        print(body);
                        final res = await http.post(
                          'https://hackverse.herokuapp.com/api/QNA/award',
                          headers: {
                            'content-type': 'application/json',
                            'Content-Length': body.length.toString(),
                          },
                          body: body,
                        );
                        print ('accept: ${res.statusCode}');
                    },
                    child: const Text('Accept'),
                  ),
                );
              } else {
                return const SizedBox(width: 0, height: 0);
              }
            }),
          ],
        ),
      ),
    );
  }
}
