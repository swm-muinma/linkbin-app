import 'package:flutter/material.dart';
import 'package:linkbin_app/widgets/search/tag_filter.dart';

class SearchTextWidget extends StatefulWidget {
  @override
  _SearchTextWidgetState createState() => _SearchTextWidgetState();
}

class _SearchTextWidgetState extends State<SearchTextWidget> {
  final TextEditingController _controller = TextEditingController();

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
          TagFilterWidget(),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: '검색어를 입력하세요',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _search,
            child: const Text('북마크 내역 중에 검색하기'),
          ),
        ],
      ),
    );
  }
}
