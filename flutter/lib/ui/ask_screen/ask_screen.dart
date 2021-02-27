import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {},
          ),
          MainActionButton(
            label: 'Post',
            onPressed: () {},
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
