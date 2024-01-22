import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase) : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase similarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());

    var result = await similarBooksUseCase.call(category);
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure.message));
      },
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
