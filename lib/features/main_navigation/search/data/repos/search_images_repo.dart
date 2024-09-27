import 'package:tarweej_platform/core/networking/api/api_error_handler.dart';
import 'package:tarweej_platform/core/networking/api/api_result.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/models/search_keyword_model.dart';
import 'package:tarweej_platform/features/main_navigation/search/data/service/search_images_service.dart';

class SearchImagesRepo {
  final SearchImagesService service;

  SearchImagesRepo({required this.service});
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
}
