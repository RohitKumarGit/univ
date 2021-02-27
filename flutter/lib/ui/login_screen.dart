import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user_bloc.dart';
import 'home_screen.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var _email = '';
  var _password = '';

  final _form = GlobalKey<FormState>();

  bool _validateAndSave() {
    if (!_form.currentState.validate()) {
      return false;
    }

    _form.currentState.save();
    return true;
  }

  void _doLogIn() {
    if (!_validateAndSave()) {
      return;
    }

    // TODO: do log in
    context.read<UserBloc>().add(
          UserEvent.signIn(
            email: _email,
            password: _password,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: add error box
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          signedIn: () => Navigator.of(context).pushAndRemoveUntil(
            HomeScreen.route(),
            (_) => false,
          ),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Univ')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _form,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    onSaved: (v) => _email = v,
                    validator: (v) => (v?.isNotEmpty ?? false)
                        ? null
                        : 'Email cannot be empty',
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onSaved: (v) => _password = v,
                    validator: (v) => (v?.isNotEmpty ?? false)
                        ? null
                        : 'Email cannot be empty',
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        signingIn: () => TextButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          child: const Text('Log In'),
                        ),
                        orElse: () => TextButton(
                          onPressed: _doLogIn,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
