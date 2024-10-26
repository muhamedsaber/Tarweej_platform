import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/logic/search_keywords/search_keywords_state.dart';

import '../../logic/search_keywords/search_images_notifier.dart';
import 'search_keywords_listview_builder.dart';

class SearchKeywordsConsumer extends ConsumerWidget {
  const SearchKeywordsConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchImagesNotifierProvider);
    final searchProvider = ref.watch(searchImagesNotifierProvider.notifier);
    if (state is SearchKeywordsUpdatedState || state is SearchImagesSuccess) {
      return SearchKeywordsListViewBuilder(
        keywords: searchProvider.keywords,
        onSelectKeyword: (model) {
          searchProvider.selectedKeyword = model;
          searchProvider.images.clear();
          searchProvider.searchImages();
        },
      );
    } else if (state is SearchImagesError) {
      return Center(
        child: Text(state.error.errorMessage ?? ""),
      );
    } else if (state is SearchImagesLoading) {
      return const CircularProgressIndicator();
    } else {
      return const SizedBox.shrink();
    }
  }
}
