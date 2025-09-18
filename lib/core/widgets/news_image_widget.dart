import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsImageWidget extends StatelessWidget {
  const NewsImageWidget({
    super.key,
    required this.imageUrl,
    this.aspectRatio = 16 / 9,
    this.borderRadius = 16.0,
  });

  final String? imageUrl;
  final double aspectRatio;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey[100],
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          errorWidget: (context, url, error) => Image.network(
            fit: BoxFit.fill,
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGZjYKPjVrCS_uKmuUXIkYNXPA3x0q_Y-hYQ&s',
          ),
        ),
      ),
    );
  }
}
