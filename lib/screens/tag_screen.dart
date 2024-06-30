import 'package:flutter/material.dart';
import 'package:linkbin_app/service/interface/book_mark/book_mark_service.dart';
import 'package:linkbin_app/service/interface/book_mark/fetch_strategy.dart';
import 'package:linkbin_app/service/interface/group/group_service.dart';
import 'package:linkbin_app/widgets/book_mark/book_mark_list_widget.dart';
import 'package:linkbin_app/widgets/common/icon_card.dart';
import 'package:linkbin_app/widgets/group/group_list_widget.dart';

class TagScreen extends StatefulWidget {
  final BookMarkService bookMarkService;
  final GroupService groupService;

  const TagScreen({
    super.key,
    required this.groupService,
    required this.bookMarkService,
  });

  @override
  _TagScreenState createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        GroupListWidget(
            groupService: widget.groupService,
            title: "공유받은 페이지들이 있어요",
            subTitle: "다른 사람들의 북마크를 확인하세요",
            iconImage: Image.asset('assets/images/gift.png'),
            size: Size(screenWidth, screenHeight / 3)),
        SizedBox(height: 20),
        IconCard(
          title: "내 페이지도 공유하세요",
          iconImage: Image.asset('assets/images/folder.png'),
          size: Size(screenWidth, screenHeight / 10),
          children: [],
        ),
      ],
    );
  }
}
