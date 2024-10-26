import 'dart:developer';

import 'package:tarweej_platform/core/networking/api/api_error_handler.dart';
import 'package:tarweej_platform/core/networking/api/api_result.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/models/search_keyword_model.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/service/search_images_service.dart';

import '../../../home/data/models/upsplash_image_model.dart';
import '../models/search_images_request_model.dart';

class SearchRepo {
  final SearchService service;

  SearchRepo({required this.service});
  Future<ApiResult<List<SearchKeywordModel>>> searchForKeywords({
    required String query,
  }) async {
    try {
      final response = await service.searchForKeywords(query: query);
      final List<SearchKeywordModel> kewords = (response.data as List).map((e) {
        return SearchKeywordModel.fromJson(e);
      }).toList();
      return ApiResult.success(kewords);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<UpsplashImageModel>>> searchForImages({
    required SearchImagesRequestModel searchModel,
  }) async {
    try {
      final response = await service.searchForImages(searchModel: searchModel);
      List<UpsplashImageModel> models =
          (response.data["results"] as List).map((e) {
        return UpsplashImageModel.fromJson(e);
      }).toList();

      return ApiResult.success(models);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }
}
