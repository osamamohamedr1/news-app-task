part of 'search_news_cubit.dart';

@immutable
sealed class SearchNewsState {}

final class SearchNewsInitial extends SearchNewsState {}

final class SearchNewsLoading extends SearchNewsState {}

final class SearchNewsLoaded extends SearchNewsState {
  final List<NewsModel> newsList;

  SearchNewsLoaded(this.newsList);
}

final class SearchNewsFailure extends SearchNewsState {
  final String errorMessage;

  SearchNewsFailure(this.errorMessage);
}
