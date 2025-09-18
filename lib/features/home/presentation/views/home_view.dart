import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_task/core/routing/routes.dart';
import 'package:news_app_task/core/utils/extensions.dart';
import 'package:news_app_task/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:news_app_task/features/home/presentation/views/widgets/home_news_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                final newsItem = state.news[index];
                return HomeNewsItem(
                  newsModel: newsItem,
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed(Routes.newsDetail, arguments: newsItem);
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
