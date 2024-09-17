import 'package:photo_manager/photo_manager.dart';

class MediaHelper {
  static Future<List<AssetPathEntity>> loadAllAlbums() async {
    return await PhotoManager.getAssetPathList(
      onlyAll: false,
      type: RequestType.image,
    );
  }
  static Future<List<AssetEntity>> loadAllImages({
    required int page,
    required int numberOfImages
  })async{
    return await PhotoManager.getAssetListPaged(page: page, pageCount: numberOfImages);
  }
  static Future<List<AssetEntity>> loadImagesForAlbum({
    required AssetPathEntity album,
    required int page,
    required int size
  })async{
   return await album.getAssetListPaged(page: page, size: size);
  }
}
