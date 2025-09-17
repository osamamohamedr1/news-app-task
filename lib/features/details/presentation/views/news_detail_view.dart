import 'package:flutter/material.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/utils/text_styles.dart';
import 'package:news_app_task/features/details/presentation/views/widgets/detail_image_widget.dart';
import 'package:news_app_task/features/details/presentation/views/widgets/detail_title_widget.dart';
import 'package:news_app_task/features/details/presentation/views/widgets/detail_content_widget.dart';
import 'package:news_app_task/features/details/presentation/views/widgets/detail_action_button_widget.dart';
import 'package:news_app_task/features/home/presentation/views/widgets/news_source_date_widget.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
        ),
        title: Text('Article Details', style: TextStyles.font18BlackBold),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full-size image
            DetailImageWidget(imageUrl: newsModel.urlToImage, height: 250),

            // Content section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Source and Date
                  NewsSourceDateWidget(
                    sourceName: newsModel.source?.name,
                    publishedAt: newsModel.publishedAt,
                  ),

                  // Full title
                  DetailTitleWidget(title: newsModel.title),

                  // Full content/description
                  DetailContentWidget(
                    content: newsModel.description ?? newsModel.content,
                  ),

                  // Additional content if available
                  if (newsModel.content != null &&
                      newsModel.content!.isNotEmpty &&
                      newsModel.content != newsModel.description)
                    Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Content:',
                          style: TextStyles.font16WhiteBold.copyWith(
                            color: Colors.black87,
                          ),
                        ),
                        DetailContentWidget(content: newsModel.content),
                      ],
                    ),

                  // Author information if available
                  if (newsModel.author != null && newsModel.author!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 8),
                          Text(
                            'By ${newsModel.author}',
                            style: TextStyles.font12GreyW500,
                          ),
                        ],
                      ),
                    ),

                  // Action button
                  DetailActionButtonWidget(url: newsModel.url),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
