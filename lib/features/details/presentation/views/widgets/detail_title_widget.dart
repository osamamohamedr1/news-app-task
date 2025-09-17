import 'package:flutter/material.dart';
import 'package:news_app_task/core/utils/text_styles.dart';

class DetailTitleWidget extends StatelessWidget {
  const DetailTitleWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'No title available',
      style: TextStyles.font20BlackBold,
    );
  }
}