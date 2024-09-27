import 'package:dio/dio.dart';
import 'package:tarweej_platform/core/networking/api/dio_interface.dart';
import 'package:tarweej_platform/core/networking/api/endpoints.dart';

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
}
