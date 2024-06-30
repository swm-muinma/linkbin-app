import 'package:flutter/material.dart';
import 'package:linkbin_app/service/interface/book_mark/book_mark_service.dart';
import 'package:linkbin_app/service/api/book_mark/fake_book_mark_api.dart';
import 'package:linkbin_app/service/interface/book_mark/fetch_strategy.dart';
import 'package:linkbin_app/widgets/book_mark/book_mark_list_widget.dart';

class HomeScreen extends StatelessWidget {
  final BookMarkService bookMarkService;

  const HomeScreen({Key? key, required this.bookMarkService});

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
          title: '미분류 북마크',
          iconImage: Image.asset('assets/images/folder.png'),
          size: Size(screenWidth, screenHeight / 3),
        ),
        BookMarkListWidget(
          bookMarkService: bookMarkService,
          fetchStrategy: FetchRecentViewStrategy(),
          title: '북마크 점수',
          iconImage: Image.asset('assets/images/score.png'),
          size: Size(screenWidth, screenHeight / 3),
        ),
        BookMarkListWidget(
          bookMarkService: bookMarkService,
          fetchStrategy: FetchRecentRegisterStrategy(),
          title: '저장했던 글을 지금 읽으세요',
          iconImage: Image.asset('assets/images/link.png'),
          size: Size(screenWidth, screenHeight / 3),
        ),
        BookMarkListWidget(
          bookMarkService: bookMarkService,
          fetchStrategy: FetchRecentViewStrategy(),
          title: '공유받은 북마크 보기',
          iconImage: Image.asset('assets/images/gift.png'),
          size: Size(screenWidth, screenHeight / 3),
        ),
      ],
    );
  }
}
