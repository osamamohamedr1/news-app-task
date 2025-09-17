import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/features/search/presentation/manager/cubit/search_news_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SerchTextField(
          performSearch: (value) {
            context.read<SearchNewsCubit>().getSearchedNews(query: value);
          },
          searchController: _searchController,
        ),
        actions: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                });
              },
            ),
        ],
      ),
      body: BlocBuilder<SearchNewsCubit, SearchNewsState>(
        builder: (context, state) {
          if (state is SearchNewsLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.newsList[index].title ?? ''));
              },
            );
          } else if (state is SearchNewsFailure) {
            return Center(child: Text(state.errorMessage));
          } else if (state is SearchNewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Start Search'));
          }
        },
      ),
    );
  }
}

class SerchTextField extends StatelessWidget {
  const SerchTextField({
    super.key,
    this.performSearch,
    required this.searchController,
  });

  final TextEditingController searchController;
  final void Function(String)? performSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: const InputDecoration(
        hintText: 'Search for news...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black54),
      ),
      style: const TextStyle(color: Colors.black),
      onChanged: performSearch,
      onSubmitted: performSearch,
    );
  }
}
