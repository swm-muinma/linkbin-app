import 'package:flutter/material.dart';
import 'package:linkbin_app/service/interface/book_mark/book_mark_service.dart';
import 'package:linkbin_app/service/api/book_mark/fake_book_mark_api.dart';
import 'package:linkbin_app/service/interface/book_mark/fetch_strategy.dart';
import 'package:linkbin_app/widgets/book_mark/book_mark_list_widget.dart';

class LinkScreen extends StatelessWidget {
  final BookMarkService bookMarkService;

  const LinkScreen({Key? key, required this.bookMarkService});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        BookMarkListWidget(
          bookMarkService: bookMarkService,
          fetchStrategy: FetchRecentRegisterStrategy(),
          title: '최근 저장한 링크',
          iconImage: Image.asset('assets/images/link.png'),
          size: Size(screenWidth, screenHeight / 3),
        ),
        BookMarkListWidget(
          bookMarkService: bookMarkService,
          fetchStrategy: FetchRecentViewStrategy(),
          title: '추천 링크',
          iconImage: Image.asset('assets/images/link.png'),
          size: Size(screenWidth, screenHeight / 3),
        ),
      ],
    );
  }
}
