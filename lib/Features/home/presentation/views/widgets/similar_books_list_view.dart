import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
              image:
                  'https://as1.ftcdn.net/v2/jpg/02/56/88/20/1000_F_256882045_oLSZBDt24jsGoNTvt64lcnebmy2rjtzN.jpg',
            ),
          );
        },
      ),
    );
  }
}
