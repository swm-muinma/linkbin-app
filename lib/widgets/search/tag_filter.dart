import 'package:flutter/material.dart';

class TagFilterWidget extends StatefulWidget {
  @override
  _TagFilterWidgetState createState() => _TagFilterWidgetState();
}

class _TagFilterWidgetState extends State<TagFilterWidget> {
  final TextEditingController _tagController = TextEditingController();
  List<String> _tags = [];

  void _addTag(String tag) {
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
        _tagController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tagChips = _tags.map((tag) {
      return Chip(
        label: Text(tag),
        onDeleted: () {
          setState(() {
            _tags.remove(tag);
          });
        },
      );
    }).toList();

    tagChips.add(
      Chip(
        label: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: IntrinsicHeight(
            child: IntrinsicWidth(
              child: TextField(
                controller: _tagController,
                onSubmitted: (value) => _addTag(value),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "#태그 추가",
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: tagChips,
    );
  }
}
