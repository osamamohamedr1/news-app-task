import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_task/core/routing/routes.dart';
import 'package:news_app_task/core/utils/extensions.dart';
import 'package:news_app_task/core/widgets/loading_news.dart';
import 'package:news_app_task/features/home/data/models/category_model.dart';
import 'package:news_app_task/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:news_app_task/features/home/presentation/views/widgets/category_list_widget.dart';
import 'package:news_app_task/features/home/presentation/views/widgets/news_list_widget.dart';
import 'package:news_app_task/features/home/presentation/views/widgets/sliver_error_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedCategory = 'general';

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
    context.read<HomeCubit>().getLatestNews(category: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff001F3F),
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: SvgPicture.asset('assets/images/app_title.svg'),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.search);
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return context.read<HomeCubit>().getLatestNews(
            category: selectedCategory,
          );
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoryListWidget(
                categories: categoriesList,
                selectedCategory: selectedCategory,
                onCategorySelected: _onCategorySelected,
              ),
            ),

            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return NewsListWidget(newsList: state.news);
                } else if (state is HomeError) {
                  return SliverErrorWidget(
                    selectedCategory: selectedCategory,
                    errorMessage: state.errorMessage,
                  );
                } else {
                  return SliverFillRemaining(
                    child: Center(child: LoadingNews()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
