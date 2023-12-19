import '../../entity/book.dart';

abstract interface class BookService {
  // 도서 등록
  Future<void> createBook({required Book book});

  // 도서 삭제
  Future<void> deleteBook({required Book book});

  // 도서 현황 조회(필터 적용)
  Future<List<Book>> getBooks();
}
