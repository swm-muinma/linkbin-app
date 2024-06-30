import 'package:linkbin_app/service/interface/group/group_service.dart';
import 'package:linkbin_app/models/group/group_data.dart';
import 'package:linkbin_app/models/book_mark/book_mark_data.dart';

class FakeGroupService implements GroupService {
  @override
  Future<List<GroupData>> fetchGroups() async {
    return [
      GroupData(
        title: 'Flutter 스터디',
        subTitle: 'A-Z로 배우는 Flutter',
        thumbnailUrl: 'https://picsum.photos/50/50',
        leaderId: '1',
        memberIds: ['1', '2'],
        bookmarks: [
          BookMarkData(
            title: 'Flutter 공식 문서',
            contentUrl: 'https://flutter.dev/',
            thumbnailUrl: 'https://picsum.photos/50/50',
            date: DateTime.now(),
          ),
          BookMarkData(
            title: 'Flutter 공식 문서',
            contentUrl: 'https://flutter.dev/',
            thumbnailUrl: 'https://picsum.photos/50/50',
            date: DateTime.now(),
          ),
        ],
      ),
      GroupData(
        title: 'Dart',
        subTitle: 'Dart의 신이 되고 싶어요',
        thumbnailUrl: 'https://picsum.photos/50/50',
        leaderId: '2',
        memberIds: ['1', '2'],
        bookmarks: [
          BookMarkData(
            title: 'Dart 공식 문서',
            contentUrl: 'https://dart.dev/',
            thumbnailUrl: 'https://picsum.photos/50/50',
            date: DateTime.now(),
          ),
          BookMarkData(
            title: 'Dart 공식 문서',
            contentUrl: 'https://dart.dev/',
            thumbnailUrl: 'https://picsum.photos/50/50',
            date: DateTime.now(),
          ),
        ],
      ),
      GroupData(
        title: 'Firebase',
        subTitle: 'Firebase로 서버 없이 개발하기',
        thumbnailUrl: 'https://picsum.photos/50/50',
        leaderId: '3',
        memberIds: ['1', '2'],
        bookmarks: [
          BookMarkData(
            title: 'Firebase 공식 문서',
            contentUrl: 'https://firebase.google.com/',
            thumbnailUrl: 'https://picsum.photos/50/50',
            date: DateTime.now(),
          ),
          BookMarkData(
            title: 'Firebase 공식 문서',
            contentUrl: 'https://firebase.google.com/',
            thumbnailUrl: 'https://picsum.photos/50/50',
            date: DateTime.now(),
          ),
        ],
      ),
    ];
  }
}
