import 'package:flutter/material.dart';

class TagContainer extends StatefulWidget {
  const TagContainer({
    Key key,
    this.tags,
    this.onTap,
  }) : super(key: key);

  final List<String> tags;
  final Function(String) onTap;

  @override
  _TagContainerState createState() => _TagContainerState();
}

class _TagContainerState extends State<TagContainer> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.tags.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                    children: widget.tags
                        .map((t) => Tag(
                              name: t,
                              onTap: () => widget.onTap(t),
                            ))
                        .toList()),
              ),
            ),
            const Divider(),
          ],
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  Tag({
    @required this.name,
    @required this.onTap,
  }) : super(key: Key(name));

  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.yellow.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(name),
        ),
      ),
    );
  }
}