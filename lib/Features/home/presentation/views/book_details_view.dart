import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: 'computer science');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(book: widget.book),
    );
  }
}
