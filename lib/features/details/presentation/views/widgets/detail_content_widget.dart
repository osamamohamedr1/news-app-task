import 'package:flutter/material.dart';
import 'package:news_app_task/core/utils/text_styles.dart';

class DetailContentWidget extends StatelessWidget {
  const DetailContentWidget({
    super.key,
    required this.content,
  });

  final String? content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content ?? 'No content available',
      style: TextStyles.font14GreyNormal.copyWith(height: 1.6),
    );
  }
}