import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/blocs.dart';
import '../../repo/repo.dart';
import '../login_screen.dart';
import '../widgets/main_action_button.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<Repo>().user;
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen<void>(
          signedOut: () => Navigator.of(context).pushAndRemoveUntil(
            LogInScreen.route(),
            (_) => false,
          ),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(user.name),
          actions: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return MainActionButton(
                  label: 'Log Out',
                  color: Colors.red,
                  onPressed: state.maybeWhen(
                    signingOut: () => null,
                    orElse: () => () {
                      context.read<UserBloc>().add(const UserEvent.signOut());
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.green.shade100,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Text(
                user.email,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                children: [
                  // TODO: add onTap
                  ProfileTile(
                    icon: FontAwesomeIcons.coins,
                    title: 'Credit History',
                    onTap: () {},
                    color: Colors.deepOrangeAccent,
                  ),
                  ProfileTile(
                    icon: FontAwesomeIcons.solidCommentAlt,
                    title: 'My Questions',
                    onTap: () {},
                    color: Colors.greenAccent,
                  ),
                  ProfileTile(
                    icon: FontAwesomeIcons.video,
                    title: 'My Sessions',
                    onTap: () {},
                    color: Colors.blueAccent,
                  ),
                  ProfileTile(
                    icon: FontAwesomeIcons.solidFileAlt,
                    title: 'Saved Notes',
                    onTap: () {},
                    color: Colors.amber,
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

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.onTap,
    @required this.color,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        color: color.withOpacity(0.3),
        child: ListTile(
          leading: FaIcon(icon),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const FaIcon(FontAwesomeIcons.chevronRight),
          onTap: onTap,
        ),
      ),
    );
  }
}
