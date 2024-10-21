// states

import 'package:tarweej_platform/features/main_navigation/home/data/models/upsplash_image_model.dart';

import '../../../../../../core/networking/api/api_error_model.dart';

class SearchImagesState {}

class SearchImagesInitial extends SearchImagesState {}

class SearchImagesLoading extends SearchImagesState {}

class SearchImagesSuccess extends SearchImagesState {

  SearchImagesSuccess();
}

class SearchImagesError extends SearchImagesState {
  final ApiErrorModel error;

  SearchImagesError({required this.error});
}

class SearchImagesKeywordUpadated extends SearchImagesState {
  SearchImagesKeywordUpadated();
}
