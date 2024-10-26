// states

import '../../../../../../core/networking/api/api_error_model.dart';

class SearchImagesState {}

class SearchImagesInitial extends SearchImagesState {}

class SearchImagesLoading extends SearchImagesState {}

class SearchImagesSuccess extends SearchImagesState {}

class SearchImagesError extends SearchImagesState {
  final ApiErrorModel error;

  SearchImagesError({required this.error});
}

class SearchKeywordsUpdatedState extends SearchImagesState {
  SearchKeywordsUpdatedState();
}
