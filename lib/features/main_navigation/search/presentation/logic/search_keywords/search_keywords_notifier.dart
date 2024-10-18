import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/logic/upsplash_images_notifier/upsplash_home_images.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/models/search_keyword_model.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/repos/search_images_repo.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/logic/search_keywords/search_keywords_state.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/logic/search_keywords/search_static_data.dart';

import '../../../../home/data/models/upsplash_image_model.dart';
import '../../../data/models/search_images_request_model.dart';

class SearchKeywordsNotifier extends StateNotifier<SearchImagesState> {
  final SearchImagesRepo repo;
  final TextEditingController searchKewordsController = TextEditingController();
  final TextEditingController searchImagesController = TextEditingController();
  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();
  // Search Keywords
  List<SearchKeywordModel> keywords = [];
  // images vars
  List<UpsplashImageModel> images = [];
  SearchImagesRequestModel searchModel = SearchImagesRequestModel(
    page: 1,
    query: "",
    perPage: 20,
  );

  SearchKeywordsNotifier({required this.repo}) : super(SearchImagesInitial()) {
    _searchSubject
        .debounceTime(const Duration(milliseconds: 300))
        .distinct()
        .listen((query) {
      searchKeywords(query);
    });
  }

  @override
  void dispose() {
    _searchSubject.close();
    searchKewordsController.dispose();
    searchImagesController.dispose();
    super.dispose();
  }

  void onSearchChanged(String query) {
    _searchSubject.add(query);
  }

  void searchKeywords(String query) {
    // loading only if the state is initial
    state = SearchImagesLoading();
    repo.searchForKeywords(query: query).then((value) {
      value.when(
        onSuccess: (data) {
          keywords = data;
          state = SearchImagesKeywordUpadated();
        },
        onError: (e) {
          state = SearchImagesError(error: e);
        },
      );
    });
  }

  void searchImages() {
    // loading only if the state is initial
    state = SearchImagesLoading();

    repo.searchForImages(searchModel: searchModel).then((value) {
      value.when(
        onSuccess: (data) {
          images = data;
          state = SearchImagesSuccess();
        },
        onError: (e) {
          state = SearchImagesError(error: e);
        },
      );
    });
  }
}

final searchImagesNotifierProvider =
    StateNotifierProvider<SearchKeywordsNotifier, SearchImagesState>(
        (ref) => SearchKeywordsNotifier(repo: getIt<SearchImagesRepo>()));
