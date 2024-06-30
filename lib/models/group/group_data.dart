import 'package:linkbin_app/models/book_mark/book_mark_data.dart';

class GroupData {
  final String title;
  final String subTitle;
  final String leaderId;
  final String thumbnailUrl;
  final List<String> memberIds;
  final List<BookMarkData> bookmarks;

  GroupData({
    required this.title,
    required this.subTitle,
    required this.leaderId,
    required this.memberIds,
    required this.thumbnailUrl,
    required this.bookmarks,
  });

  factory GroupData.fromJson(Map<String, dynamic> json) {
    var memberIdsFromJson = List<String>.from(json['memberIds']);
    var bookmarksFromJson = List<Map<String, dynamic>>.from(json['bookmarks'])
        .map((bookmarkJson) => BookMarkData.fromJson(bookmarkJson))
        .toList();

    return GroupData(
      title: json['name'],
      subTitle: json['subTitle'],
      leaderId: json['leaderId'],
      thumbnailUrl: json['thumbnailUrl'],
      memberIds: memberIdsFromJson,
      bookmarks: bookmarksFromJson,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'subTitle': subTitle,
        'leaderId': leaderId,
        'memberIds': memberIds,
        'thumbnailUrl': thumbnailUrl,
        'bookmarks': bookmarks.map((bookmark) => bookmark.toJson()).toList(),
      };
}
