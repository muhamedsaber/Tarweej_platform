import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/repos/search_images_repo.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/logic/search_keywords/search_keywords_state.dart';

class SearchKeywordsNotifier extends StateNotifier<SearchKeywordsState> {
  SearchKeywordsNotifier({required this.repo}) : super(SearchKeywordsInitial());
  final SearchImagesRepo repo;
  final TextEditingController controller = TextEditingController();

  void searchKeywords() {
    repo.searchForKeywords(query: controller.text).then((value) {
      value.when(
        onSuccess: (data) {
          state = SearchKeywordsLoaded(keywords: data);
        },
        onError: (e) {
          state = SearchKeywordsError(error: e);
        },
      );
    });
  }
}

final searchKeywordsNotifierProvider =
    StateNotifierProvider<SearchKeywordsNotifier, SearchKeywordsState>(
        (ref) => SearchKeywordsNotifier(repo: getIt<SearchImagesRepo>()));
