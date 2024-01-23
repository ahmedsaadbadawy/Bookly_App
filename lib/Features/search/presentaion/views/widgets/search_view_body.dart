import 'package:bookly_app/Features/search/presentaion/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_search_text_field.dart';
import 'search_books_list_view_bloc_consumer.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? title = ' ';
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                CustomSearchTextField(
                  onChanged: (data) {
                    title = data;
                    BlocProvider.of<SearchBooksCubit>(context)
                        .fechSearchBooks(title: title!);
                  },
                  onPressed: () {
                    BlocProvider.of<SearchBooksCubit>(context)
                        .fechSearchBooks(title: title!);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SearchBooksListViewBlocConsumer(),
        )
      ],
    );
  }
}
