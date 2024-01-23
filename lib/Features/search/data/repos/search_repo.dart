import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchBooks(String title);
}
