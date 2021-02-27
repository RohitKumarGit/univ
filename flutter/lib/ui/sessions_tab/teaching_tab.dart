part of 'sessions_tab.dart';

class TeachingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionsBloc, SessionsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () {
            final sessions = context.watch<Repo>().teachingSessions;
            return RefreshIndicator(
              onRefresh: () {
                final c = Completer<void>();
                context
                    .read<TeachingSessionsBloc>()
                    .add(SessionsEvent.refresh(c));
                return c.future;
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemCount: sessions.length,
                itemBuilder: (context, i) {
                  return TeachingSessionTile(sessions[i]);
                },
              ),
            );
          },
        );
      },
    );
  }
}

class TeachingSessionTile extends StatelessWidget {
  TeachingSessionTile(this.session);

  final TeachingSession session;

  final _df = DateFormat.MMMd();
  final _tf = DateFormat.jm();
  final _rand = Random();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        title: Text(session.title),
        leading: CircleAvatar(
          backgroundColor: Colors.accents[_rand.nextInt(Colors.accents.length)]
              .withOpacity(0.25),
          child: Text(
            '${session.credits}c',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          session.student,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _df.format(session.dateTime),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _tf.format(session.dateTime),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
