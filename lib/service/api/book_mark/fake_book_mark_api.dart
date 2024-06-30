import '../../interface/book_mark/book_mark_service.dart';
import '../../../models/book_mark/book_mark_data.dart';

class FakeBookMarkService implements BookMarkService {
  @override
  Future<List<BookMarkData>> fetchRecentRegisterBookMark() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    List<BookMarkData> fakeData = [
      BookMarkData(
          title: '[등록]UI 용어 정리',
          contentUrl: 'https://brunch.co.kr/@tigrisdesign/2',
          thumbnailUrl: 'https://picsum.photos/50/50',
          date: DateTime.now()),
      BookMarkData(
          title: '[등록]MVVM 가이드',
          contentUrl:
              'https://medium.com/blocship/mvvm-in-flutter-a-beginners-guide-c5ce67462b85',
          thumbnailUrl: 'https://picsum.photos/50/50',
          date: DateTime.now()),
      BookMarkData(
          title: '[등록]Fluuter Project Structure',
          contentUrl:
              'https://codewithandrea.com/articles/flutter-project-structure/',
          thumbnailUrl: 'https://picsum.photos/50/50',
          date: DateTime.now()),
    ];

    return fakeData;
  }

  @override
  Future<List<BookMarkData>> fetchRecentViewBookMark() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    List<BookMarkData> fakeData = [
      BookMarkData(
          title: '[조회]UI 용어 정리',
          contentUrl: 'https://brunch.co.kr/@tigrisdesign/2',
          thumbnailUrl: 'https://picsum.photos/50/50',
          date: DateTime.now()),
      BookMarkData(
          title: '[조회]MVVM 가이드',
          contentUrl:
              'https://medium.com/blocship/mvvm-in-flutter-a-beginners-guide-c5ce67462b85',
          thumbnailUrl: 'https://picsum.photos/50/50',
          date: DateTime.now()),
      BookMarkData(
          title: '[조회]Fluuter Project Structure',
          contentUrl:
              'https://codewithandrea.com/articles/flutter-project-structure/',
          thumbnailUrl: 'https://picsum.photos/50/50',
          date: DateTime.now()),
    ];

    return fakeData;
  }
}
