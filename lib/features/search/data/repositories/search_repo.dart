import 'package:dartz/dartz.dart';
import 'package:news_app_task/core/errors/failure.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<NewsModel>>> searchNews(String query);
}
