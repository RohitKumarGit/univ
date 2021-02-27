import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../repo/repo.dart';
import '../session_detail/session_detail.dart';
import '../widgets/main_action_button.dart';
import '../widgets/show_filters.dart';
import '../widgets/tag_container.dart';
import 's_app_bar_state.dart';

part 'discussion_tab.dart';
part 'teaching_tab.dart';

class SessionsTab extends StatefulWidget {
  @override
  _SessionsTabState createState() => _SessionsTabState();
}

class _SessionsTabState extends State<SessionsTab>
    with SingleTickerProviderStateMixin {
  static const _tabs = TabBar(
    tabs: [
      Tab(child: Text('Teaching', style: TextStyle(color: Colors.black))),
      Tab(child: Text('Discussion', style: TextStyle(color: Colors.black))),
    ],
  );

  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<SAppBarState>(
        builder: (context, appBarState, tabViews) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  const Size.fromHeight(kToolbarHeight + kTextTabBarHeight),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: appBarState.isSearch
                    ? AppBar(
                        key: const Key('SearchBar'),
                        leading: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () =>
                              context.read<SAppBarState>().isSearch = false,
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
                                context.read<SAppBarState>().addTag(),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ],
                        bottom: _tabs,
                      )
                    : AppBar(
                        key: const Key('ActionBar'),
                        title: const Text('Sessions'),
                        actions: [
                          IconButton(
                            icon: const Icon(Icons.tune),
                            onPressed: () => showFilters(
                              context,
                              Consumer<SAppBarState>(
                                builder: (context, state, _) {
                                  const filters = SFilter.values;
                                  return FiltersList(
                                    filters: filters
                                        .map(
                                          (f) => FilterConf(
                                            value: f,
                                            icon: f.icon,
                                            title: f.title,
                                          ),
                                        )
                                        .toList(),
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
                                context.read<SAppBarState>().isSearch = true,
                          ),
                          MainActionButton(
                            label: 'Create',
                            onPressed: () {},
                            color: Colors.blue,
                          ),
                        ],
                        bottom: _tabs,
                      ),
              ),
            ),
            body: Column(
              children: [
                TagContainer(
                  tags: appBarState.tags,
                  onTap: (t) => context.read<SAppBarState>().removeTag(t),
                ),
                Expanded(child: tabViews),
              ],
            ),
          );
        },
        child: TabBarView(
          children: [
            TeachingTab(),
            DiscussionTab(),
          ],
        ),
      ),
    );
  }
}
