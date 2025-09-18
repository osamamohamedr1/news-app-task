import 'package:flutter/material.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/utils/text_styles.dart';
import 'package:news_app_task/core/widgets/news_image_widget.dart';
import 'package:news_app_task/core/widgets/news_source_date_widget.dart';

class HomeNewsItem extends StatelessWidget {
  const HomeNewsItem({super.key, required this.newsModel, this.onTap});

  final NewsModel newsModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsImageWidget(imageUrl: newsModel.urlToImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 8,
                children: [
                  NewsSourceDateWidget(
                    sourceName: newsModel.source?.name,
                    publishedAt: newsModel.publishedAt,
                  ),

                  Text(
                    newsModel.title ?? 'No title available',
                    style: TextStyles.font18BlackBold,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  if (newsModel.description != null &&
                      newsModel.description!.isNotEmpty)
                    Text(
                      newsModel.description!,
                      style: TextStyles.font14GreyNormal,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
