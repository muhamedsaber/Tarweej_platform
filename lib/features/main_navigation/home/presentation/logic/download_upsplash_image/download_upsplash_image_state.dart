import '../../../../../../core/networking/api/api_error_model.dart';

class DownloadUpsplashImageState {}
class DownloadUpsplashImageSucces extends DownloadUpsplashImageState {
  

}
class DownloadUpsplashImageInitial extends DownloadUpsplashImageState {}
class DownloadUpsplashImageFaliure extends DownloadUpsplashImageState {
  final ApiErrorModel error;
  DownloadUpsplashImageFaliure({required this.error});
}
class DownloadUpsplashImageLoading  extends DownloadUpsplashImageState{
  final double progress;
  DownloadUpsplashImageLoading({required this.progress});
}