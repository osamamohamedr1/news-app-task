import 'package:flutter/material.dart';
import 'package:news_app_task/core/utils/text_styles.dart';

class LoadingNews extends StatelessWidget {
  const LoadingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 45,
          height: 45,
          child: CircularProgressIndicator(strokeWidth: 4),
        ),
        Text(
          'Loading news...',
          style: TextStyles.font16WhiteBold.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
