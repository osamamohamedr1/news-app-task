import 'package:flutter/material.dart';
import 'package:news_app_task/core/models/news_model/news_model.dart';
import 'package:news_app_task/core/utils/text_styles.dart';

class AuthorNameWIdget extends StatelessWidget {
  const AuthorNameWIdget({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text('By ${newsModel.author}', style: TextStyles.font12GreyW500),
        ],
      ),
    );
  }
}
