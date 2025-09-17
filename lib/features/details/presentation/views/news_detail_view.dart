import 'package:flutter/material.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/utils/text_styles.dart';
import 'package:news_app_task/features/details/presentation/views/widgets/author_name_widget.dart';
import 'package:news_app_task/features/details/presentation/views/widgets/detail_image_widget.dart';
import 'package:news_app_task/features/details/presentation/views/widgets/detail_action_button_widget.dart';
import 'package:news_app_task/features/home/presentation/views/widgets/news_source_date_widget.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsViewAppBar(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailImageWidget(imageUrl: newsModel.urlToImage, height: 250),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NewsSourceDateWidget(
                    sourceName: newsModel.source?.name,
                    publishedAt: newsModel.publishedAt,
                  ),

                  Text(
                    newsModel.title ?? 'No title available',
                    style: TextStyles.font20BlackBold,
                  ),

                  Text(
                    newsModel.description ?? 'No content available',
                    style: TextStyles.font14GreyNormal.copyWith(height: 1.6),
                  ),

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
                        Text(
                          newsModel.content ?? 'No content available',
                          style: TextStyles.font14GreyNormal,
                        ),
                      ],
                    ),

                  if (newsModel.author != null && newsModel.author!.isNotEmpty)
                    AuthorNameWIdget(newsModel: newsModel),

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

  AppBar detailsViewAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      scrolledUnderElevation: 0.0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
      ),
      title: Text('Article Details', style: TextStyles.font18BlackBold),
      centerTitle: true,
    );
  }
}
