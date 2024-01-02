import '../../../../library_app/src/entity/book.dart';

abstract interface class BookService {
  // 도서 등록
  Future<Book> resisterBook({required Book book});

  // 도서 등록 삭제
  Future<void> deleteBook({required Book book});

  // 모든 도서 현황 조회
  Future<List<Book>> getAllBooks();

  // 도서 정보 수정
  Future<Book> updateBook({required Book book});

  // 책 이름으로 검색
  Future<List<Book>> retrieveBooksFromName({required String bookName});

  // 책 등록번호(uid)로 검색
  Future<Book> retrieveBooksFromUid({required String uid});

  // 책 저자로 검색
  Future<List<Book>> retrieveBooksFromAuthor({required String author});
}
