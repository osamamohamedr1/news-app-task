import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/core/routing/routes.dart';
import 'package:news_app_task/core/utils/text_styles.dart';
import 'package:news_app_task/features/search/presentation/manager/cubit/search_news_cubit.dart';
import 'package:news_app_task/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:news_app_task/features/search/presentation/views/widgets/search_news_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: SearchTextField(),
      ),
      body: BlocBuilder<SearchNewsCubit, SearchNewsState>(
        builder: (context, state) {
          if (state is SearchNewsLoaded) {
            return state.newsList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No News Found',
                          style: TextStyles.font20BlackBold.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try searching with different keywords',
                          style: TextStyles.font14GreyNormal,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: state.newsList.length,
                    itemBuilder: (context, index) {
                      final newsItem = state.newsList[index];
                      return SearchNewsItem(
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 80, color: Colors.red[400]),
                  const SizedBox(height: 16),
                  Text(
                    'Search Failed',
                    style: TextStyles.font20BlackBold.copyWith(
                      color: Colors.red[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      state.errorMessage,
                      style: TextStyles.font14GreyNormal,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SearchNewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 8),
                  Text(
                    'Enter keywords to search for news',
                    style: TextStyles.font14GreyNormal,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
