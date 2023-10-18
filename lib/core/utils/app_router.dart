import 'package:book_store/core/utils/service_locator.dart';
import 'package:book_store/features/home/presentaion/manager/search_books_cubit/search_books_cubit.dart';
import 'package:book_store/features/home/presentaion/views/book_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/book_model/book_model.dart';
import '../../features/home/data/repos/home_repo_docmentaion.dart';
import '../../features/home/presentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../features/home/presentaion/views/home_page_view.dart';
import '../../features/search/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomePageView = '/homePageView';

  static const kBookDetailsView = '/bookDetailsView';

  static const kSearchView = '/SearchView';

  static final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomePageView,
      builder: (context, state) => const HomePageView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
        child: BooksDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    ),
    GoRoute(
        path: kSearchView,
        builder: ((context, state) => BlocProvider(
              create: (context) => SearchBooksCubit(getIt.get<HomeRepoImpl>()),
              child:const SearchView(
                // bookModel:state.extra as BookModel,
              ),
            )))
  ]);
}
