import 'package:flutter/material.dart';

import 'widgets/book_detail_view_body.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookDetailViewBody(),
    );
  }
}