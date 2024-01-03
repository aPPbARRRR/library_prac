import '../../../common/domain/model/book.dart';
import '../model/book_search_type.dart';

abstract interface class BookRepository {
  // read - 도서관 전체 책 목록 반환
  Future<List<Book>> getAllBooks();

  // read - 특정 조건의 책 목록 반환
  Future<List<Book>> retrieveBooks(
      {required String searchText, required BookSearchType bookSearchType});

  // create - 신규 도서 등록
  Future<Book> registerBook({required Book book});

  // update - 도서 정보 수정
  Future<Book> updateBook({required Book book});

  // delete - 도서 삭제
  Future<void> unregisterBook({required Book book});
}
