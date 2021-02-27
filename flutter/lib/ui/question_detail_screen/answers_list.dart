import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../repo/repo.dart';

class AnswersList extends StatelessWidget {
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
            final answers = state.answers;
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: answers.length,
              itemBuilder: (context, i) {
                return AnswerTile(answers[i]);
              },
            );
          },
        );
      },
    );
  }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile(this.a);

  final Answer a;

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
            Consumer<Repo>(
              builder: (context, repo, _) {
                
              }
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text('Accept'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
