import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/core/utils/text_styles.dart';
import 'package:news_app_task/features/home/presentation/manager/cubit/home_cubit.dart';

class SliverErrorWidget extends StatelessWidget {
  const SliverErrorWidget({
    super.key,
    required this.selectedCategory,
    required this.errorMessage,
  });

  final String selectedCategory;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return context.read<HomeCubit>().getLatestNews(
          category: selectedCategory,
        );
      },
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 80, color: Colors.red[400]),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      errorMessage,
                      style: TextStyles.font14GreyNormal,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    'Pull down to refresh',
                    style: TextStyles.font14GreyNormal,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
