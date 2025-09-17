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

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (value.trim().isEmpty) return;
      context.read<SearchNewsCubit>().getSearchedNews(query: value);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

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
      onChanged: _onSearchChanged,
      onSubmitted: (value) {
        if (value.trim().isEmpty) return;
        context.read<SearchNewsCubit>().getSearchedNews(query: value);
      },
    );
  }
}
