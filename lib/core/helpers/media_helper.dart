
import 'package:photo_manager/photo_manager.dart';

class MediaHelper {
  static Future<List<AssetPathEntity>> loadAllAlbums() async {
    return await PhotoManager.getAssetPathList(
      onlyAll: false,
      type: RequestType.image,
    );
  }

  static Future<List<AssetEntity>> loadAllImages(
      {required int page, required int numberOfImages}) async {
    return await PhotoManager.getAssetListPaged(
        page: page, pageCount: numberOfImages);
  }

  static Future<List<AssetEntity>> loadImagesForAlbum(
      {required AssetPathEntity album,
      required int page,
      required int size}) async {
    return await album.getAssetListPaged(page: page, size: size);
  }

  // Future<Directory> createAppImagesFolderInDevice() async {
  //   Directory appDocumentsDirectory;

  //   // For Android, you can use external storage, but permission might be needed.
  //   if (Platform.isAndroid) {
  //     if (await Permission.storage.request().isGranted) {
  //       appDocumentsDirectory = await getExternalStorageDirectory();
  //     } else {
  //       // Fallback to app's internal storage if permission is not granted
  //       appDocumentsDirectory = await getApplicationDocumentsDirectory();
  //     }
  //   } else {
  //     // For iOS and other platforms, use the app's documents directory
  //     appDocumentsDirectory = await getApplicationDocumentsDirectory();
  //   }

  //   // Create the folder if it doesn't exist
  //   final Directory appImagesFolder =
  //       Directory('${appDocumentsDirectory.path}/AppImages');
  //   if (!await appImagesFolder.exists()) {
  //     await appImagesFolder.create(recursive: true);
  //   }

  //   return appImagesFolder;
  // }
}
