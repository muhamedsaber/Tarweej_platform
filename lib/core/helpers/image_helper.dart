import 'package:flutter/foundation.dart';
import 'package:photo_manager/photo_manager.dart';

class ImageHelper {
  static Future<Uint8List?> convertAssetEntityToUint8List(
      AssetEntity assetEntity) async {
    return await assetEntity.originBytes;
  }
}
