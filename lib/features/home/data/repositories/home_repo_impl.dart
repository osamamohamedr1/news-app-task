import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_task/core/constants/endpoints.dart';
import 'package:news_app_task/core/errors/failure.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/network/api_service.dart';
import 'package:news_app_task/features/home/data/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<NewsModel>>> getLatestNews() async {
    try {
      List<NewsModel> newsList = [];
      final response = await apiService.get(
        endPoint: topHeadlinesEndpoint,
        queryParams: {'apiKey': dotenv.env['API_KEY']},
      );
      for (var article in response['articles']) {
        newsList.add(NewsModel.fromJson(article));
      }
      for (var news in response['articles']) {
        newsList.add(NewsModel.fromJson(news));
      }
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
