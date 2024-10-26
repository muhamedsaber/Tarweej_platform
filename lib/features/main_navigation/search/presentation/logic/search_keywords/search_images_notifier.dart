import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/models/search_keyword_model.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/repos/search_images_repo.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/logic/search_keywords/search_keywords_state.dart';

import '../../../../home/data/models/upsplash_image_model.dart';
import '../../../data/models/search_images_request_model.dart';

class SearchImagesNotifier extends StateNotifier<SearchImagesState> {
  final SearchRepo searchImagesRepo;
  final TextEditingController searchKewordsController = TextEditingController();
  final TextEditingController searchImagesController = TextEditingController();

  /// images scroll controller
  final ScrollController scrollController = ScrollController();
  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();
  bool isAlreadyLoadingMoreImages = false;
  bool hasMoreImages = true; // New flag to track if there are more images

  // Search Keywords
  List<SearchKeywordModel> keywords = [];
  SearchKeywordModel selectedKeyword = SearchKeywordModel();
  // images
  List<UpsplashImageModel> images = [];
  SearchImagesRequestModel searchModel = SearchImagesRequestModel(
    page: 1,
    query: "",
    perPage: 20,
  );

  SearchImagesNotifier({required this.searchImagesRepo})
      : super(SearchImagesInitial()) {
    _searchSubject
        .debounceTime(const Duration(milliseconds: 500))
        .listen((query) {
      _searchKeywords(query);
    });
    scrollController.addListener(_onScroll);
  }

  /// This function is called when the user scrolls to the bottom of the images
  _onScroll() {
    /// id the previous search is already loading more images or there are no more images
    /// it will not call the search function
    if (!isAlreadyLoadingMoreImages && _isReachedBottom) {
      searchModel = searchModel.copyWith(page: searchModel.page + 1);
      searchImages(searchKeyWord: searchImagesController.text);
    }
  }

  /// This function is used to check if the user reached the bottom of the images
  /// it will return true if the user is 50 pixels away from the bottom
  bool get _isReachedBottom {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 50) {
      return true;
    }
    return false;
  }

  /// This function is called when the user types in the search bar
  /// to debounce the search and avoid calling the search function
  /// after each character typed , it will wait for 500 ms after the user
  /// stops typing to call the search function
  void onSearchChanged(String query) async {
    _searchSubject.add(query);
  }

  /// This function is used to search for keywords based on the query
  /// and update the state based on the result of the search
  /// its private because it should not be called from outside the class
  /// ui should call [onSearchChanged] to search for keywords
  void _searchKeywords(String query) async {
    if (query.isEmpty) return;

    state = SearchImagesLoading();
    searchImagesRepo.searchForKeywords(query: query).then((value) {
      value.when(
        onSuccess: (data) {
          keywords = data;
          state = SearchKeywordsUpdatedState();
        },
        onError: (e) {
          state = SearchImagesError(error: e);
        },
      );
    });
  }

  searchImages({
    String? searchKeyWord,
  }) {
    if (images.isEmpty) {
      state = SearchImagesLoading();
    }
    if (isAlreadyLoadingMoreImages || !hasMoreImages) return;

    /// First case
    /// if user do not select any keyword and just submit the search
    /// it will navigate to the search result page with the submitted query and start searching for images
    /// or user is already in the search result page and he wants to search for new images directly

    if (searchKeyWord != null) {
      searchModel = searchModel.copyWith(query: searchKeyWord);
      searchImagesController.text = searchKeyWord;
    }

    /// Second case
    /// if user select a keyword from the list of keywords
    /// it will navigate to the search page with the selected keyword
    else if (selectedKeyword.word != null) {
      searchModel = searchModel.copyWith(query: selectedKeyword.word!);
      searchImagesController.text = selectedKeyword.word!;
    }
    isAlreadyLoadingMoreImages = true;
    searchImagesRepo.searchForImages(searchModel: searchModel).then((value) {
      value.when(
        onSuccess: (data) {
          if (data.isEmpty) {
            hasMoreImages = false;
          }
          images = images..addAll(data);
          state = SearchImagesSuccess();
        },
        onError: (e) {
          state = SearchImagesError(error: e);
        },
      );
    });

    isAlreadyLoadingMoreImages = false;
  }

  /// This function is used to reset the search keywords view to its initial state
  /// Used When user close the search keywords bar
  resetSearchKeywordsViewToInitialState() {
    state = SearchImagesInitial();
  }

  // disposing the controllers and the subject
  @override
  void dispose() {
    _searchSubject.close();
    searchKewordsController.dispose();
    searchImagesController.dispose();
    super.dispose();
  }
}

final searchImagesNotifierProvider =
    StateNotifierProvider<SearchImagesNotifier, SearchImagesState>(
        (ref) => SearchImagesNotifier(searchImagesRepo: getIt<SearchRepo>()));
