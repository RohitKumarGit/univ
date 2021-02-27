import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../notes_tab/notes_tab.dart';
import '../profile_tab/profile_screen.dart';
import '../questions_tab/questions_tab.dart';
import '../sessions_tab/sessions_tab.dart';
import 'tabs.dart';

class HomeScreen extends StatelessWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (_) => HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Tabs(
        routes: [
          RouteTab(
            label: 'Questions',
            icon: FontAwesomeIcons.solidCommentAlt,
            build: () => QuestionsTab(),
          ),
          RouteTab(
            label: 'Sessions',
            icon: FontAwesomeIcons.video,
            build: () => SessionsTab(),
          ),
          RouteTab(
            label: 'Notes',
            icon: FontAwesomeIcons.solidFileAlt,
            build: () => NotesTab(),
          ),
          RouteTab(
            label: 'Profile',
            icon: FontAwesomeIcons.solidUser,
            build: () => ProfileTab(),
          ),
        ],
      ),
      child: Consumer<Tabs>(
        builder: (context, tabs, _) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabs.selectedIndex,
              onTap: (i) => tabs.selectedIndex = i,
              items: tabs.routes
                  .map((t) => BottomNavigationBarItem(
                        icon: FaIcon(t.icon),
                        label: t.label,
                      ))
                  .toList(),
            ),
            body: tabs.route.build() ?? Center(child: Text(tabs.route.label)),
          );
        },
      ),
    );
  }
}
