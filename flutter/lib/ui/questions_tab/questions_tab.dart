import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../repo/repo.dart';
import '../widgets/main_action_button.dart';

class QuestionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
        actions: [
          // TODO: upload page
          MainActionButton(
            label: 'Ask',
            onPressed: () {},
            color: Colors.green,
          ),
        ],
      ),
      body: BlocBuilder<QuestionsBloc, QuestionsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () {
              final questions = context.watch<Repo>().questions;
              return RefreshIndicator(
                onRefresh: () {
                  final c = Completer<void>();
                  context.read<QuestionsBloc>().add(QuestionsEvent.refresh(c));
                  return c.future;
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemCount: questions.length,
                  itemBuilder: (context, i) {
                    return QuestionTile(questions[i]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile(this.q);

  final Question q;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Container(
        color: q.isAnswered ? Colors.green.shade50 : null,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: FittedBox(
                      child: Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.chevronUp,
                            color: q.upVoteCol,
                          ),
                          Text('${q.votes}'),
                          FaIcon(
                            FontAwesomeIcons.chevronDown,
                            color: q.downVoteCol,
                          ),
                        ],
                      ),
                    ),
                    title: Text(q.title,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                      q.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
