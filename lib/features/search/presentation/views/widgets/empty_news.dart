import 'package:flutter/material.dart';
import 'package:news_app_task/core/utils/text_styles.dart';

class EmptyNews extends StatelessWidget {
  const EmptyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 88, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No News Found',
            style: TextStyles.font20BlackBold.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyles.font14GreyNormal,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
