import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/presentaion/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../Features/splash/presentation/views/splash_view.dart';
import 'functions/setup_service_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            FetchSimilarBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          ),
          child: BookDetailsView(
            book: state.extra as BookEntity,
          ),
        ),
        ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
