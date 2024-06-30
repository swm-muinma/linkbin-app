import 'package:flutter/material.dart';
import 'package:linkbin_app/widgets/search/tag_filter.dart';

class SearchTextWidget extends StatefulWidget {
  @override
  _SearchTextWidgetState createState() => _SearchTextWidgetState();
}

class _SearchTextWidgetState extends State<SearchTextWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _searchVisible = false;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _search() {
    print("Searching for: ${_controller.text}");
    // Here you can add your search logic or call to another function
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Focus(
            focusNode: _focusNode,
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: '검색어를 입력하세요',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            onFocusChange: (hasFocus) {
              setState(() {
                _searchVisible = hasFocus;
              });
            },
          ),
          SizedBox(height: 20),
          TagFilterWidget(),
          if (_searchVisible) TagFilterWidget(),
        ],
      ),
    );
  }
}
