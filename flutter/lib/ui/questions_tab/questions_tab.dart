import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../repo/repo.dart';
import '../widgets/main_action_button.dart';
import 'q_app_state.dart';

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
              TagContainer(tags: appBarState.tags),
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

class TagContainer extends StatefulWidget {
  const TagContainer({
    Key key,
    this.tags,
  }) : super(key: key);

  final List<String> tags;

  @override
  _TagContainerState createState() => _TagContainerState();
}

class _TagContainerState extends State<TagContainer> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.tags.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                    children: widget.tags
                        .map((t) => Tag(
                              name: t,
                              onTap: () => context
                                  .read<QAppBarState>()
                                  .removeTag(t),
                            ))
                        .toList()),
              ),
            ),
            const Divider(),
          ],
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  Tag({
    @required this.name,
    @required this.onTap,
  }) : super(key: Key(name));

  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.yellow.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(name),
        ),
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
