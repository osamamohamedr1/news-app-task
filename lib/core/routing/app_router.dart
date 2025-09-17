import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/core/routing/routes.dart';
import 'package:news_app_task/core/utils/service_locator.dart';
import 'package:news_app_task/features/home/data/repositories/home_repo.dart';
import 'package:news_app_task/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:news_app_task/features/home/presentation/views/home_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                HomeCubit(getIt.get<HomeRepo>())..getLatestNews(),
            child: HomeView(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route founded in ${settings.name}')),
          ),
        );
    }
  }
}
