import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../Features/search/presentaion/views/widgets/search_view_body.dart';
import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchViewBody = '/SearchViewBody';
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
      builder: (context, state) => const BookDetailsView(),
    ),
    GoRoute(
      path:kSearchViewBody,
      builder: (context, state) => const SearchViewBody(),
    ),
  ]);
}
