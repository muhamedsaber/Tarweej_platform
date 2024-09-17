import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

import '../../../../core/common_ui/widgets/image_preview.dart';

class ImagesGridViewBuilder extends StatelessWidget {
  const ImagesGridViewBuilder(
      {super.key, required this.photos, required this.controller});
  final List<AssetEntity> photos;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // this key is used to save the scroll position of the grid view
      // so when the state changes or the widget is rebuilt the scroll position will be saved
      key: const PageStorageKey('imagesGridView'),
      controller: controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return FutureBuilder<Uint8List?>(
          future: photos[index].thumbnailData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PreviewSelectedImage(
                asset: photos[index],
                thumbnail: snapshot.data!,
              );
            } else if (snapshot.hasError) {
              return const Center(child: Icon(Icons.error));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: context.theme.colorScheme.secondary.withOpacity(0.2),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}

class PreviewSelectedImage extends StatelessWidget {
  const PreviewSelectedImage(
      {super.key, required this.asset, required this.thumbnail});
  final AssetEntity asset;
  final Uint8List thumbnail;

  @override
  Widget build(BuildContext context) {
    return ImagePreview(
      lowerSizeImage: Image.memory(
        // Thumbnail image to display in Grid
        thumbnail,
        fit: BoxFit.cover,
      ), // Show the thumbnail in Grid
      asset: asset, // Pass the asset to fetch full image when previewing
    );
  }
}
