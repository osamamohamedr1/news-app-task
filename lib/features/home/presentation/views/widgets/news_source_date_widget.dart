import 'package:flutter/material.dart';
import 'package:news_app_task/core/utils/text_styles.dart';

class NewsSourceDateWidget extends StatelessWidget {
  const NewsSourceDateWidget({super.key, this.sourceName, this.publishedAt});

  final String? sourceName;
  final String? publishedAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        if (sourceName != null && sourceName!.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.lightBlueAccent.shade100,
                width: 0.2,
              ),
            ),
            child: Text(sourceName!, style: TextStyles.font11BlueW600),
          ),

        if (publishedAt != null) ...[
          Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              _formatDate(publishedAt!),
              style: TextStyles.font12GreyW500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays > 30) {
        return '${date.day}/${date.month}/${date.year}';
      } else if (difference.inDays > 7) {
        final weeks = (difference.inDays / 7).floor();
        return '${weeks}w ago';
      } else if (difference.inDays >= 1) {
        return '${difference.inDays}d ago';
      } else if (difference.inHours >= 1) {
        return '${difference.inHours}h ago';
      } else if (difference.inMinutes >= 1) {
        return '${difference.inMinutes}m ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return 'Unknown date';
    }
  }
}
