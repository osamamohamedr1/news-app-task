import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app_task/core/utils/text_styles.dart';

class DetailActionButtonWidget extends StatelessWidget {
  const DetailActionButtonWidget({super.key, required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: url != null && url!.isNotEmpty
            ? () => _launchUrl(url!, context)
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        icon: const Icon(Icons.open_in_browser, size: 20),
        label: Text('Read Full Article', style: TextStyles.font16WhiteBold),
      ),
    );
  }

  Future<void> _launchUrl(String url, BuildContext context) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        log('Could not launch URL: $url');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not open article. Please try again.'),
              backgroundColor: Colors.red[600],
            ),
          );
        }
      }
    } catch (e) {
      log('Error launching URL: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening article. Please try again.'),
            backgroundColor: Colors.red[600],
          ),
        );
      }
    }
  }
}
