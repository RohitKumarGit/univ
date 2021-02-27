import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../repo/repo.dart';
import '../answer_screen/answer_screen.dart';
import 'answers_list.dart';

class QuestionDetailScreen extends StatelessWidget {
  const QuestionDetailScreen(this.q);

  final Question q;

  static MaterialPageRoute route(Question q) =>
      MaterialPageRoute(builder: (_) => QuestionDetailScreen(q));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => AnswersBloc(
        repo: ctx.read<Repo>(),
        question: q,
      )..add(const AnswersEvent.fetch()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () => Navigator.of(context).push(
                    AnswerScreen.route(context.read<AnswersBloc>()),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: const Text(
                    'Answer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            children: [
              QuestionBox(q),
              AnswersList(q),
            ],
          ),
        );
      }),
    );
  }
}

class QuestionBox extends StatelessWidget {
  const QuestionBox(this.q);

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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${q.name} • ${_df.format(q.date)} ${_tf.format(q.date)}',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    q.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                MarkdownBody(data: q.description),
              ],
            ),
          ),
          const Divider(thickness: 1),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: VoteButton(
                    icon: FontAwesomeIcons.chevronUp,
                    label: 'Upvote',
                    color: q.upVoteCol,
                  ),
                ),
                const VerticalDivider(thickness: 1),
                Expanded(
                  child: VoteButton(
                    icon: FontAwesomeIcons.chevronDown,
                    label: 'Downvote',
                    color: q.downVoteCol,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VoteButton extends StatelessWidget {
  const VoteButton({
    Key key,
    this.icon,
    this.label,
    Color color,
  })  : color = color ?? Colors.black54,
        super(key: key);

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
