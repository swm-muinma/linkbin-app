import 'package:flutter/material.dart';
import 'package:linkbin_app/service/interface/book_mark/book_mark_service.dart';
import 'package:linkbin_app/service/interface/book_mark/fetch_strategy.dart';
import 'package:linkbin_app/widgets/book_mark/book_mark_list_widget.dart';
import 'package:linkbin_app/widgets/search/search_text.dart';

class SearchScreen extends StatefulWidget {
  final BookMarkService bookMarkService;

  const SearchScreen({super.key, required this.bookMarkService});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        SearchTextWidget(),
        BookMarkListWidget(
          bookMarkService: widget.bookMarkService,
          fetchStrategy: FetchRecentRegisterStrategy(),
          title: '북마크',
          iconImage: Image.asset('assets/images/folder.png'),
          size: Size(screenWidth, screenHeight / 3),
        ),
        BookMarkListWidget(
          bookMarkService: widget.bookMarkService,
          fetchStrategy: FetchRecentViewStrategy(),
          title: '추천 북마크',
          iconImage: Image.asset('assets/images/folder.png'),
          size: Size(screenWidth, screenHeight / 3),
        ),
      ],
    );
  }
}
