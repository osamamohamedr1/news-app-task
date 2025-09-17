import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_task/core/network/api_service.dart';
import 'package:news_app_task/features/home/data/repositories/home_repo.dart';
import 'package:news_app_task/features/home/data/repositories/home_repo_impl.dart';
import 'package:news_app_task/features/search/data/repositories/search_repo.dart';
import 'package:news_app_task/features/search/data/repositories/search_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt<ApiService>()));

  getIt.registerSingleton<SearchRepo>(SearchRepoImpl(getIt<ApiService>()));
}
