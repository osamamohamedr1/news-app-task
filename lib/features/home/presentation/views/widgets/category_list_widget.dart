import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_task/core/utils/colors_manger.dart';
import 'package:news_app_task/core/utils/text_styles.dart';
import 'package:news_app_task/features/home/data/models/category_model.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<CategoryModel> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      margin: EdgeInsets.symmetric(vertical: 16.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category.query;
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () => onCategorySelected(category.query),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isSelected ? ColorsManager.blue : Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: isSelected ? ColorsManager.blue : Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    category.name,
                    style: isSelected
                        ? TextStyles.font14GreyNormal.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )
                        : TextStyles.font14GreyNormal.copyWith(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
