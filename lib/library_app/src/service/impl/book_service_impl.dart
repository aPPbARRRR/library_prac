import 'package:library_manage_app/library_app/src/entity/book.dart';
import 'package:library_manage_app/library_app/src/service/interface/book_service.dart';

import '../../data/repository/database_repository.dart';

class BookServiceImpl implements BookService {
  BookServiceImpl({required this.repository});

  final DatabaseRepository repository;
  @override
  Future<Book> resisterBook({required Book book})async {
 return await repository.registerBook(book: book);  
  }

  @override
  Future<void> deleteBook({required Book book}) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getBooks() async {
    return await repository.getBooks();
  }
  
  @override
  List<Book> retrieveBooksFromName({required List<Book> books, required String bookName})  =>
      books.where((book) => book.bookName.contains(bookName)).toList();
  
}