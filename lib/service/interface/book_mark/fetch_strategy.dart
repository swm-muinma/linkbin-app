import 'package:linkbin_app/service/interface/book_mark/book_mark_service.dart';
import 'package:linkbin_app/models/book_mark/book_mark_data.dart';

abstract class FetchStrategy {
  Future<List<BookMarkData>> fetch(BookMarkService service);
}

class FetchRecentRegisterStrategy implements FetchStrategy {
  @override
  Future<List<BookMarkData>> fetch(BookMarkService service) {
    return service.fetchRecentRegisterBookMark();
  }
}

class FetchRecentViewStrategy implements FetchStrategy {
  @override
  Future<List<BookMarkData>> fetch(BookMarkService service) {
    return service.fetchRecentViewBookMark();
  }
}
