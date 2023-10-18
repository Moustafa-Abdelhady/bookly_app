import 'package:book_store/core/utils/api_service.dart';
import 'package:book_store/features/home/data/repos/home_repo_docmentaion.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

//// getIt package => make one code of class and reuse it = reduce writting code
///getIt is used in service locator or debendency injection because i make an 
/// inject to one debendency and call it in specific places 
final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
