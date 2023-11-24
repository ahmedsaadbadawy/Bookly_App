import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_services.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  late ApiServise apiServise;
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServise.get(endpoint: '');
    List<BookEntity> books = getBooksList(data);

    return books;
  }

  

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }


  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
