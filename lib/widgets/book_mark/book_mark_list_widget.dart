import 'package:flutter/material.dart';
import 'package:linkbin_app/models/book_mark/book_mark_data.dart';
import 'package:linkbin_app/service/interface/book_mark/book_mark_service.dart';
import 'package:linkbin_app/service/interface/book_mark/fetch_strategy.dart';
import 'package:linkbin_app/widgets/common/icon_card.dart';
import 'package:linkbin_app/screens/book_mark/webview_screen.dart';

class BookMarkListWidget extends StatefulWidget {
  final BookMarkService bookMarkService;
  final FetchStrategy fetchStrategy;
  final String title;
  final Image iconImage;
  final Size size;

  const BookMarkListWidget({
    super.key,
    required this.bookMarkService,
    required this.fetchStrategy,
    required this.title,
    required this.iconImage,
    required this.size,
  });

  @override
  _BookMarkListWidgetState createState() => _BookMarkListWidgetState();
}

class _BookMarkListWidgetState extends State<BookMarkListWidget> {
  late Future<List<BookMarkData>> futureBookMarkData;

  @override
  void initState() {
    super.initState();
    futureBookMarkData = widget.fetchStrategy.fetch(widget.bookMarkService);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookMarkData>>(
        future: futureBookMarkData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Widget> bookMarks = snapshot.data!.map((bookMarkData) {
              return ListTile(
                leading: Image.network(bookMarkData.thumbnailUrl),
                title: Text(bookMarkData.title),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return WebViewScreen(
                        url: bookMarkData.contentUrl,
                      );
                    },
                  ));
                },
              );
            }).toList();

            return IconCard(
              title: widget.title,
              iconImage: widget.iconImage,
              size: widget.size,
              children: bookMarks,
            );
          }
        });
  }
}
