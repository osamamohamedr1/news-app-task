import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/core/routing/routes.dart';
import 'package:news_app_task/features/home/presentation/views/widgets/home_news_item.dart';
import 'package:news_app_task/features/search/presentation/manager/cubit/search_news_cubit.dart';
import 'package:news_app_task/features/search/presentation/views/widgets/search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchTextField()),
      body: BlocBuilder<SearchNewsCubit, SearchNewsState>(
        builder: (context, state) {
          if (state is SearchNewsLoaded) {
            return state.newsList.isEmpty
                ? Center(child: Text('No News Found'))
                : ListView.builder(
                    itemCount: state.newsList.length,
                    itemBuilder: (context, index) {
                      final newsItem = state.newsList[index];
                      return HomeNewsItem(
                        newsModel: newsItem,
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(Routes.newsDetail, arguments: newsItem);
                        },
                      );
                    },
                  );
          } else if (state is SearchNewsFailure) {
            return Center(child: Text(state.errorMessage));
          } else if (state is SearchNewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Start Search'));
          }
        },
      ),
    );
  }
}
