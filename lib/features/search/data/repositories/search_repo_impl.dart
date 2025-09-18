import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_task/core/errors/failure.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/network/api_service.dart';
import 'package:news_app_task/features/search/data/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<NewsModel>>> searchNews(String query) async {
    try {
      final List<NewsModel> serarchedNewsList = [];
      final response = await apiService.get(
        endPoint: 'everything',
        queryParams: {'q': query, 'apiKey': dotenv.env['API_KEY']},
      );
      for (var news in response['articles']) {
        serarchedNewsList.add(NewsModel.fromJson(news));
      }
      return Right(serarchedNewsList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(Failure(errorMessage: e.toString()));
      }
    }
  }
}
