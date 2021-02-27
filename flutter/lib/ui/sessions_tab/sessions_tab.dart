import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../repo/repo.dart';
import '../widgets/main_action_button.dart';

part 'teaching_tab.dart';
part 'discussion_tab.dart';

class SessionsTab extends StatefulWidget {
  @override
  _SessionsTabState createState() => _SessionsTabState();
}

class _SessionsTabState extends State<SessionsTab>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sessions'),
          actions: [
            // TODO: upload page
            MainActionButton(
              label: 'Create',
              onPressed: () {},
              color: Colors.blue,
            ),
          ],
          bottom: TabBar(
            tabs: const [
              Tab(child: Text('Teaching', style: TextStyle(color: Colors.black))),
              Tab(child: Text('Discussion', style: TextStyle(color: Colors.black))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TeachingTab(),
            DiscussionTab(),
          ],
        ),
      ),
    );
  }
}
