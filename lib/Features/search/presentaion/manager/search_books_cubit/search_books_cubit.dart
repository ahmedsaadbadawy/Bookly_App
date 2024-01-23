import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;

  Future<void> fechSearchBooks({required String title}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks(title);
    result.fold(
      (failure) => emit(SearchBooksFailure(failure.message)),
      (books) => emit(SearchBooksSuccess(books)),
    );
  }
}
