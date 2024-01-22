import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber =0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0});
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
