part of 'sessions_tab.dart';

class DiscussionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionsBloc, SessionsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () {
            final sessions = context.watch<Repo>().sessions;
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
