import 'package:flutter/material.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/utils/text_styles.dart';
import 'package:news_app_task/core/widgets/news_image_widget.dart';
import 'package:news_app_task/core/widgets/news_source_date_widget.dart';

class SearchNewsItem extends StatelessWidget {
  const SearchNewsItem({super.key, required this.newsModel, this.onTap});

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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 120,
                  height: 90,
                  child: NewsImageWidget(
                    imageUrl: newsModel.urlToImage,
                    aspectRatio: 120 / 90,
                    borderRadius: 12,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NewsSourceDateWidget(
                      sourceName: newsModel.source?.name,
                      publishedAt: newsModel.publishedAt,
                    ),

                    Text(
                      newsModel.title ?? 'No title available',
                      style: TextStyles.font18BlackBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
