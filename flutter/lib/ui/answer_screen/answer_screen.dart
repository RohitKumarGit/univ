import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../blocs/blocs.dart';
import '../widgets/main_action_button.dart';

class AnswerScreen extends StatelessWidget {
  AnswerScreen(this.bloc);

  final AnswersBloc bloc;

  static MaterialPageRoute route(AnswersBloc bloc) => MaterialPageRoute(
        builder: (_) => AnswerScreen(bloc),
      );

  final controller = TextEditingController();

  void _showPreview(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: size.height * 0.8,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: size.width * 0.5,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 10),
              Markdown(
                physics: const BouncingScrollPhysics(),
                data: controller.text,
                shrinkWrap: true,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () => _showPreview(context),
            ),
            MainActionButton(
              label: 'Post',
              onPressed: () {},
              color: Colors.green,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Start writing you answer here ...',
            ),
          ),
        ),
      ),
    );
  }
}
