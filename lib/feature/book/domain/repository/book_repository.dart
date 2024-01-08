import '../../../../shared/domain/model/result.dart';
import '../../../common/domain/model/book.dart';
import '../model/book_search_type.dart';

abstract interface class BookRepository {
  // read - 도서관 전체 책 목록 반환
  Future<Result<List<Book>, Exception>> getAllBooks();

  // read - 특정 조건의 책 목록 반환
  Future<Result<List<Book>, Exception>> retrieveBooks(
      {required String searchText, required BookSearchType bookSearchType});

  // create - 신규 도서 등록
  Future<Result<Book, Exception>> registerBook({required Book book});

  // update - 도서 정보 수정
  Future<Result<Book, Exception>> updateBook({required Book book});

  // delete - 도서 삭제
  Future<Result<void, Exception>> unregisterBook({required Book book});
}
