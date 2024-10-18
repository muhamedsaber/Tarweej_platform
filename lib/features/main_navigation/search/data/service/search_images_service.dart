import 'package:dio/dio.dart';
import 'package:tarweej_platform/core/networking/api/dio_interface.dart';
import 'package:tarweej_platform/core/networking/api/api_constants.dart';

import '../models/search_images_request_model.dart';

class SearchImagesService {
  final ApiInterface api;
  SearchImagesService(this.api);
  Future<Response> searchForKeywords({
    required String query,
  }) async {
    return await api.get(ApiConstants.datamuseWordsEndpoint, queryParameters: {
      "ml": query,
    });
  }

  Future<Response> searchForImages(
      {required SearchImagesRequestModel searchModel}) async {
    return await api.get(ApiConstants.upSplashSearchPhotos, queryParameters: {
      "query": searchModel.query,
      "page": searchModel.page,
      "per_page": searchModel.perPage,
      if (searchModel.orderBy != null) "order_by": searchModel.orderBy,
      if (searchModel.color != null) "color": searchModel.color,
      if (searchModel.orientation != null)
        "orientation": searchModel.orientation,
    });
  }
}
