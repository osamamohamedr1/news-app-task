import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/features/search/data/repositories/search_repo.dart';

part 'search_news_state.dart';

class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit(this.searchRepo) : super(SearchNewsInitial());
  final SearchRepo searchRepo;

  Future<void> getSearchedNews({required String query}) async {
    emit(SearchNewsLoading());
    var result = await searchRepo.searchNews(query);

    result.fold(
      (failure) {
        emit(SearchNewsFailure(failure.errorMessage));
      },
      (searchedList) {
        emit(SearchNewsLoaded(searchedList));
      },
    );
  }

  void clearSearch() {
    emit(SearchNewsInitial());
  }
}
