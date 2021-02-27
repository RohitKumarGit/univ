import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
            build: () => null,
          ),
          RouteTab(
            label: 'Sessions',
            icon: FontAwesomeIcons.video,
            build: () => null,
          ),
          RouteTab(
            label: 'Notes',
            icon: FontAwesomeIcons.solidFileAlt,
            build: () => null,
          ),
          RouteTab(
            label: 'Profile',
            icon: FontAwesomeIcons.solidUser,
            build: () => null,
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
