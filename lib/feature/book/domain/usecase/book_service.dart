import '../../../../shared/domain/model/result.dart';
import '../../../common/domain/model/book.dart';
import '../model/book_search_type.dart';

abstract interface class BookService {
  // 도서 등록
  Future<Result<Book, Exception>> resisterBook({required Book book});

  // 도서 등록 삭제
  Future<Result<void, Exception>> deleteBook({required Book book});

  // 모든 도서 현황 조회
  Future<Result<List<Book>, Exception>> getAllBooks();

  // 도서 정보 수정
  Future<Result<Book, Exception>> updateBook({required Book book});

  // 책 이름, 등록번호(uid), 저자로 검색
  Future<Result<List<Book>, Exception>> retrieveBooks(
      {required String searchText, required BookSearchType bookSearchType});
}
