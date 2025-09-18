import 'package:flutter/material.dart';
import 'package:news_app_task/features/home/data/models/category_model.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.category.name),
          ElevatedButton(onPressed: () {}, child: Text('Select Category')),
        ],
      ),
    );
  }
}
