import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/repos/upsplash_repo.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/logic/download_upsplash_image/download_upsplash_image_state.dart';

import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/networking/api/dio_consumer.dart';
import '../../../data/services/upsplash_service.dart';

class DownloadUpsplashImageNotifier
    extends StateNotifier<DownloadUpsplashImageState> {
  DownloadUpsplashImageNotifier({required this.repo})
      : super(DownloadUpsplashImageInitial());
  final UpsplashRepo repo;

  downloadImage({
    required String url,
  }) async {
    final savePath = await _getSavePath();

    final result = await repo.downloadImage(
      url: url,
      savePath: savePath,
      onReceiveProgress: (p0, p1) async {
        state = DownloadUpsplashImageLoading(
            progress: p0.toDouble() / p1.toDouble() * 100);
      },
    );

    result.when(onSuccess: (data) async {
      await ImageGallerySaver.saveFile(savePath, isReturnPathOfIOS: true);

      state = DownloadUpsplashImageSucces();
    }, onError: (e) {
      state = DownloadUpsplashImageFaliure(error: e);
    });
  }

  //-----Helpers

  // image name is the current time

  // Helper method to get the save path
  Future<String> _getSavePath() async {
    final directoryPath = await getDirectoryPath();

    final time = DateTime.now().toString();

    return '$directoryPath/$time.jpg';
  }

  // Get the directory path that
  // getExternalStorageDirectory() for android it will return the path of the external storage
  // getApplicationDocumentsDirectory() for ios it will return the path of the application documents directory
  // Why its different for android and ios?
  // because the android and ios have different file system structure
  Future<String> getDirectoryPath() async {
    // Get the directory path
    if (Platform.isAndroid) {
      final directory = await getTemporaryDirectory();
      return directory.path;
    } else {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    }
  }
}

final downloadUpsplashImageProvider = StateNotifierProvider<
        DownloadUpsplashImageNotifier, DownloadUpsplashImageState>(
    (ref) => DownloadUpsplashImageNotifier(
        repo: UpsplashRepo(service: UpsplashService(getIt<DioConsumer>()))));
