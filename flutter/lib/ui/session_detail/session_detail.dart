import 'package:flutter/material.dart';
import 'package:univ/ui/widgets/main_action_button.dart';

import '../../models/models.dart';

class SessionDetail extends StatelessWidget {
  const SessionDetail(this.session);

  final Session session;

  static MaterialPageRoute route(Session s) => MaterialPageRoute(
        builder: (_) => SessionDetail(s),
      );

  @override
  Widget build(BuildContext context) {
    // final now = DateTime.now();
    // final secs = session.dateTime.difference(now).inSeconds;
    // print(secs);
    return Scaffold(
      appBar: AppBar(
          // actions: [
          //   if (secs > 0 && secs <= 7200)
          //     MainActionButton(
          //       label: 'RSVP',
          //       onPressed: () {},
          //       color: Colors.blue,
          //     ),
          // ],
          ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SessionDet(
              label: 'Title',
              value: session.title,
            ),
            SessionDet(
              label: 'Tags',
              value: session.tags.toString(),
            ),
            SessionDet(
              label: 'Date & Time',
              value: session.dateTime.toString(),
            ),
            SessionDet(
              label: 'Max Attendees',
              value: session.maxAttendees.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class SessionDet extends StatelessWidget {
  const SessionDet({
    this.label,
    this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label : ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(value),
      ],
    );
  }
}
