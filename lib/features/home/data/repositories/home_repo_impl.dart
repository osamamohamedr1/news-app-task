import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app_task/core/constants/top_headline_endpoint.dart';
import 'package:news_app_task/core/errors/failure.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/network/api_service.dart';
import 'package:news_app_task/features/home/data/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<NewsModel>>> getLatestNews() async {
    List<NewsModel> newsList = [];
    final response = await apiService.get(endPoint: topHeadlinesEndpoint);
    for (var article in response['articles']) {
      newsList.add(NewsModel.fromJson(article));
    }
    try {
      for (var news in response['articles']) {
        newsList.add(NewsModel.fromJson(news));
      }
      log(newsList.first.description ?? "not found");
      return Right(newsList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(Failure(errorMessage: e.toString()));
      }
    }
  }
}
