import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../blocs/blocs.dart';
import '../widgets/main_action_button.dart';
import '../widgets/tag_container.dart';

class AskScreen extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (_) => AskScreen(),
      );

  @override
  _AskScreenState createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  String _title = '';
  String _description = '';
  final List<String> _tags = [];

  final _form = GlobalKey<FormState>();
  final _tagController = TextEditingController();

  void _showPreview(BuildContext context) {
    if (!_validateAndSave()) {
      return;
    }

    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: size.height * 0.8,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 0.5,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  _title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Markdown(
                physics: const BouncingScrollPhysics(),
                data: _description,
                shrinkWrap: true,
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTag() {
    final t = _tagController.text;
    if (t.isNotEmpty && !_tags.contains(t)) {
      setState(() {
        _tags.add(t);
        _tagController.clear();
      });
    }
  }

  void _removeTag(String t) {
    setState(() => _tags.remove(t));
  }

  bool _validateAndSave() {
    if (!_form.currentState.validate()) {
      return false;
    }

    _form.currentState.save();
    return true;
  }

  void _post() {
    if (!_validateAndSave()) {
      return;
    }

    context.read<PostQuestionBloc>().add(PostQuestionEvent.post(
          title: _title,
          description: _description,
          tags: _tags,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () => _showPreview(context),
          ),
          MainActionButton(
            label: 'Post',
            onPressed: _post,
            color: Colors.green,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        onSaved: (v) => _title = v,
                        validator: (v) => (v?.isNotEmpty ?? false)
                            ? null
                            : 'Title Cannot be empty',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                        minLines: 2,
                        maxLines: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        onSaved: (v) => _description = v,
                        validator: (v) => (v?.isNotEmpty ?? false)
                            ? null
                            : 'Title Cannot be empty',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                        ),
                        minLines: 7,
                        maxLines: 10000,
                      ),
                    ),
                    TagContainer(
                      tags: _tags,
                      onTap: _removeTag,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _tagController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Tag',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _addTag,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
