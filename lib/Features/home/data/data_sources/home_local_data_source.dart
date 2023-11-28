import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(kFeaturedBox);
    
    int length = box.values.length;
    if (startIndex >= length) {
      return [];
    } else if (endIndex > length) {
      endIndex = length - startIndex;
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(kNewestdBox);

     int length = box.values.length;
    if (startIndex >= length) {
      return [];
    } else if (endIndex > length) {
      endIndex = length - startIndex;
    }

    return box.values.toList().sublist(startIndex,endIndex);
  }
}
