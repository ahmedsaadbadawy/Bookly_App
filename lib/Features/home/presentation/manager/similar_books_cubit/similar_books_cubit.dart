import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_newest_books_use_case.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.newestBooksUseCase) : super(SimilarBooksInitial());
  final FetchNewestBooksUseCase newestBooksUseCase;

  Future<void> fetchSimilarBooks() async {
    emit(SimilarBooksLoading());

    var result = await newestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure.message));
      },
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
