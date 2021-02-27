import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../repo/repo.dart';
import '../app_bar_state.dart';
import '../widgets/main_action_button.dart';
import '../widgets/show_filters.dart';
import '../widgets/tag_container.dart';

enum QFilter {
  date,
  votes,
  answers,
}

extension QFilterExt on QFilter {
  // ignore: missing_return
  String get title {
    switch (this) {
      case QFilter.date: return 'Date';
      case QFilter.votes: return 'Votes';
      case QFilter.answers: return 'Answers';
    }
  }

  // ignore: missing_return
  IconData get icon {
    switch (this) {
      case QFilter.date: return FontAwesomeIcons.calendar;
      case QFilter.votes: return FontAwesomeIcons.chevronUp;
      case QFilter.answers: return FontAwesomeIcons.commentAlt;
    }
  }
}

class QAppBarState extends AppBarState {
  var _filter = QFilter.date;
  QFilter get filter => _filter;
  set filter(QFilter f) {
    if (_filter != f) {
      _filter = f;
      notifyListeners();
    }
  }
}

class QuestionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QAppBarState>(
      builder: (context, appBarState, questionList) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: appBarState.isSearch
                  ? AppBar(
                      key: const Key('SearchBar'),
                      leading: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () =>
                            context.read<QAppBarState>().isSearch = false,
                      ),
                      title: TextField(
                        controller: appBarState.textController,
                        focusNode: appBarState.focusNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Text to search',
                        ),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.local_offer_outlined),
                          onPressed: () =>
                              context.read<QAppBarState>().addTag(),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                    )
                  : AppBar(
                      key: const Key('ActionBar'),
                      title: const Text('Questions'),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.tune),
                          onPressed: () => showFilters(
                            context,
                            Consumer<QAppBarState>(
                              builder: (context, state, _) {
                                const filters = QFilter.values;
                                return FiltersList(
                                  filters: filters.map(
                                    (f) => FilterConf(
                                      value: f,
                                      icon: f.icon,
                                      title: f.title,
                                    ),
                                  ).toList(),
                                  selectedFilter: state.filter,
                                  onTap: (f) => state.filter = f,
                                );
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () =>
                              context.read<QAppBarState>().isSearch = true,
                        ),
                        MainActionButton(
                          label: 'Ask',
                          onPressed: () {},
                          color: Colors.green,
                        ),
                      ],
                    ),
            ),
          ),
          body: Column(
            children: [
              TagContainer(
                tags: appBarState.tags,
                onTap: (t) => context.read<QAppBarState>().removeTag(t),
              ),
              Expanded(child: questionList),
            ],
          ),
        );
      },
      child: BlocBuilder<QuestionsBloc, QuestionsState>(
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
