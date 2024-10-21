import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/models/search_keyword_model.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/repos/search_images_repo.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/logic/search_keywords/search_keywords_state.dart';

import '../../../../home/data/models/upsplash_image_model.dart';
import '../../../data/models/search_images_request_model.dart';

class SearchKeywordsNotifier extends StateNotifier<SearchImagesState> {
  final SearchImagesRepo repo;
  final TextEditingController searchKewordsController = TextEditingController();
  final TextEditingController searchImagesController = TextEditingController();
  final ScrollController scrollController =ScrollController();
  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();
  // Search Keywords
  List<SearchKeywordModel> keywords = [];
  SearchKeywordModel? selectedKeyword;
  // images vars
  List<UpsplashImageModel> images = [];
  SearchImagesRequestModel searchModel = SearchImagesRequestModel(
    page: 1,
    query: "",
    perPage: 20,
  );

  SearchKeywordsNotifier({required this.repo}) : super(SearchImagesInitial()) {
    log("created");
    _searchSubject
        .debounceTime(Duration(milliseconds: 500))
        .distinct()
        .listen((query) {
      log("zed");
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
          // _sortKeywordsBasedOnController();
          state = SearchImagesKeywordUpadated();
        },
        onError: (e) {
          state = SearchImagesError(error: e);
        },
      );
    });
  }

   searchImages() {
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





// int levenshteinDistance(String s1, String s2) {
//     final len1 = s1.length;
//     final len2 = s2.length;
//     final matrix =
//         List.generate(len1 + 1, (i) => List<int>.filled(len2 + 1, 0));

//     for (int i = 0; i <= len1; i++) {
//       matrix[i][0] = i;
//     }
//     for (int j = 0; j <= len2; j++) {
//       matrix[0][j] = j;
//     }

//     for (int i = 1; i <= len1; i++) {
//       for (int j = 1; j <= len2; j++) {
//         if (s1[i - 1] == s2[j - 1]) {
//           matrix[i][j] = matrix[i - 1][j - 1];
//         } else {
//           matrix[i][j] = 1 +
//               [matrix[i - 1][j], matrix[i][j - 1], matrix[i - 1][j - 1]]
//                   .reduce((a, b) => a < b ? a : b);
//         }
//       }
//     }

//     return matrix[len1][len2];
//   }

//   void _sortKeywordsBasedOnController() {
//     final controllerText = searchKewordsController.text.toLowerCase();
//     keywords.sort((a, b) {
//       final distanceA =
//           levenshteinDistance(a.word!.toLowerCase(), controllerText);
//       final distanceB =
//           levenshteinDistance(b.word!.toLowerCase(), controllerText);
//       return distanceA.compareTo(distanceB);
//     });
//   }