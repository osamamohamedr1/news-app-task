import 'package:dartz/dartz.dart';
import 'package:news_app_task/core/utils/failure.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/network/api_service.dart';

abstract class HomeRepo {
  HomeRepo(ApiService apiService);

  Future<Either<Failure, List<NewsModel>>> getLatestNews({
    String category = 'general',
  });
}
