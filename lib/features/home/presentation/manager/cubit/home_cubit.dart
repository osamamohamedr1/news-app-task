import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/features/home/data/repositories/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  Future<void> getLatestNews() async {
    log('loading');
    emit(HomeLoading());
    var result = await homeRepo.getLatestNews();
    result.fold(
      (failure) {
        emit(HomeError(errorMessage: failure.errorMessage));
      },
      (newsList) {
        emit(HomeLoaded(news: newsList));
      },
    );
  }
}
