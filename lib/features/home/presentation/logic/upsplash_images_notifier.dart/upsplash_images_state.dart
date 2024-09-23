import 'package:tarweej_platform/core/networking/api/api_error_model.dart';

import '../../../data/models/upsplash_image_model.dart';

class UpsplashImagesState {
  
}
class UpsplashImagesInitial extends UpsplashImagesState {

  
}
class UpsplashImagesLoading extends UpsplashImagesState {

  
}
class UpsplashImagesLoaded extends UpsplashImagesState {
  final List<UpsplashImageModel> images;

  UpsplashImagesLoaded({required this.images});

  
}
class UpsplashImagesError extends UpsplashImagesState {
  final ApiErrorModel error;

  UpsplashImagesError({required this.error});

  
}