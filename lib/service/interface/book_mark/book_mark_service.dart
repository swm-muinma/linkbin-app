import '../../../models/book_mark/book_mark_data.dart';

abstract class BookMarkService {
  Future<List<BookMarkData>> fetchRecentRegisterBookMark();
  Future<List<BookMarkData>> fetchRecentViewBookMark();
}
