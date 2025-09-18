import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/features/search/presentation/manager/cubit/search_news_cubit.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController searchController;
  Timer? _debounce;
  bool isSearchData = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      isSearchData = searchController.text.isNotEmpty;
    });
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (value.trim().isEmpty) {
        context.read<SearchNewsCubit>().clearSearch();
        return;
      }
      context.read<SearchNewsCubit>().getSearchedNews(query: value.trim());
    });
  }

  void _clearSearch() {
    searchController.clear();
    _debounce?.cancel();
    context.read<SearchNewsCubit>().clearSearch();
  }

  @override
  void dispose() {
    searchController.removeListener(_onTextChanged);
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search for news...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.black54),
        suffixIcon: isSearchData
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.black54, size: 20),
                onPressed: _clearSearch,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      style: const TextStyle(color: Colors.black),
      onChanged: _onSearchChanged,
      onSubmitted: (value) {
        if (value.trim().isEmpty) {
          context.read<SearchNewsCubit>().clearSearch();
          return;
        }
        context.read<SearchNewsCubit>().getSearchedNews(query: value.trim());
      },
    );
  }
}
