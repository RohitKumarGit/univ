part of 'sessions_tab.dart';

class DiscussionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SAppBarState>(builder: (context, appBarState, _) {
      return BlocBuilder<SessionsBloc, SessionsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () {
              var sessions = context.watch<Repo>().sessions;
              switch (appBarState.filter) {
                case SFilter.attendees:
                  sessions.sort(
                      (q1, q2) => q2.maxAttendees.compareTo(q1.maxAttendees));
                  break;
                case SFilter.date:
                  sessions.sort((q1, q2) => q2.dateTime.compareTo(q1.dateTime));
                  break;
              }
              if (appBarState.tags.isNotEmpty) {
                sessions = sessions.where((q) {
                  return Set<String>.from(q.tags)
                      .intersection(Set<String>.from(appBarState.tags))
                      .isNotEmpty;
                }).toList();
              }
              if (appBarState.isSearch) {
                sessions = sessions.where((q) {
                  return q.title.contains(appBarState.textController.text);
                }).toList();
              }
              return RefreshIndicator(
                onRefresh: () {
                  final c = Completer<void>();
                  context.read<SessionsBloc>().add(SessionsEvent.refresh(c));
                  return c.future;
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemCount: sessions.length,
                  itemBuilder: (context, i) {
                    return SessionTile(sessions[i]);
                  },
                ),
              );
            },
          );
        },
      );
    });
  }
}

class SessionTile extends StatelessWidget {
  SessionTile(this.session);

  final Session session;

  final _df = DateFormat('EEE, MMM d, yyyy • hh : mm aa');
  final _rand = Random();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () => Navigator.of(context).push(SessionDetail.route(session)),
        title: Text(session.title),
        leading: CircleAvatar(
          backgroundColor: Colors.accents[_rand.nextInt(Colors.accents.length)]
              .withOpacity(0.25),
          child: Text(
            session.title.characters.first,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(_df.format(session.dateTime)),
      ),
    );
  }
}
