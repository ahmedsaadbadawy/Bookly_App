import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/utils/functions/get_book_list.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServise apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchBooks(String title) async {
    try {
      var data = await apiService.get(
          endpoint: 'volumes?Sorting=newest &q=intitle:$title');
      List<BookEntity> books = getBooksList(data);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
