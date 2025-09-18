import 'package:flutter/material.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/routing/routes.dart';
import 'package:news_app_task/core/utils/extensions.dart';
import 'package:news_app_task/features/home/presentation/views/widgets/home_news_item.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({super.key, required this.newsList});

  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final newsItem = newsList[index];
        return HomeNewsItem(
          newsModel: newsItem,
          onTap: () {
            context.pushNamed(Routes.newsDetail, arguments: newsItem);
          },
        );
      }, childCount: newsList.length),
    );
  }
}
