import 'package:bookly_app/Features/search/presentaion/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_list_view.dart';

class SearchBooksListViewBlocConsumer extends StatelessWidget {
  const SearchBooksListViewBlocConsumer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit, SearchBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return SearchBooksListView(books: state.books);
        } else if (state is SearchBooksFailure) {
          return Text(state.errMessage);
        } else if (state is SearchBooksInitial) {
          return const Center(child: Text('ENTER BOOK NAME PLEASE'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
