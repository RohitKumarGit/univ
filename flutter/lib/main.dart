import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';
import 'blocs/user_bloc/user_bloc.dart';
import 'repo/repo.dart';
import 'ui/home_screen/home_screen.dart';
import 'ui/login_screen.dart';
import 'ui/questions_tab/questions_tab.dart';
import 'ui/sessions_tab/s_app_bar_state.dart';

void main() {
  final repo = Repo();
  final userBloc = UserBloc(repo: repo);
  runApp(MyApp(
    repo: repo,
    userBloc: userBloc,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NotesBloc(
                repo: context.read<Repo>(),
              )..add(const NotesEvent.fetch()),
            ),
            BlocProvider(
              create: (context) => SessionsBloc(
                repo: context.read<Repo>(),
              )..add(const SessionsEvent.fetch()),
            ),
            BlocProvider(
              create: (context) => TeachingSessionsBloc(
                repo: context.read<Repo>(),
              )..add(const SessionsEvent.fetch()),
            ),
            BlocProvider(
              create: (context) => QuestionsBloc(
                repo: context.read<Repo>(),
              )..add(const QuestionsEvent.fetch()),
            ),
          ],
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => QAppBarState()),
              ChangeNotifierProvider(create: (_) => SAppBarState()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: repo.hasUser ? HomeScreen() : LogInScreen(),
              theme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.grey.shade100,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.blue.shade700,
                  selectedLabelStyle: const TextStyle(fontSize: 12),
                ),
                appBarTheme: AppBarTheme(
                  color: Colors.grey.shade100,
                  textTheme: const TextTheme(
                    headline6: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                ),
                dividerTheme: const DividerThemeData(space: 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
