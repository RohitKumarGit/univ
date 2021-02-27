import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'blocs/user_bloc.dart';
import 'repo/repo.dart';
import 'tabs.dart';

void main() {
  final repo = Repo();
  final userBloc = UserBloc(repo: repo);
  runApp(MyApp(
    repo: repo,
    userBloc: userBloc,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    @required this.repo,
    @required this.userBloc,
  });

  final Repo repo;
  final UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repo,
      child: BlocProvider.value(
        value: userBloc,
        child: MaterialApp(
          home: HomeScreen(),
          theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.grey.shade100,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue.shade700,
              selectedLabelStyle: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
