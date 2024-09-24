import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/helpers/url_launcher_helper.dart';

import '../../data/models/upsplash_image_model.dart';

class UpsplashImageView extends StatelessWidget {
  const UpsplashImageView({super.key, required this.image});
  final UpsplashImageModel image;
  @override
  Widget build(BuildContext context) {
    log(image.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // the image hight is [log] 3953
                // so we need to calculate the height based on this value
                // 3953/100 = 39.53
                SizedBox(
                  child: Image.network(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    image.urls?.regular ?? "",
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                // link to the user profile the icon should be a world icon
                Positioned(
                  top: 40,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      // UrlLauncherHelper.launchUrl(
                      //     image.user?.links?.portfolio ?? "");
                    },
                  ),
                ),
              ],
            ),
          ),
          
          Spacer()
        ],
      ),
    );
  }
}
//  PhotoView(
//                   customSize: Size(context.screenWidth, context.screenHeight),
//                   semanticLabel: image.description ?? "",
//                   loadingBuilder: (context, event) => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   maxScale: PhotoViewComputedScale.covered * 6.0,
//                   onScaleEnd: (context, details, controllerValue) {
//                     log(controllerValue.scale.toString());
//                   },
//                   heroAttributes:
//                       PhotoViewHeroAttributes(tag: image.id.toString()),
//                   backgroundDecoration: BoxDecoration(
//                     color: context.theme.scaffoldBackgroundColor,
//                   ),
//                   basePosition: Alignment.topCenter,
//                   imageProvider: NetworkImage(
//                     image.urls?.regular ?? "",
//                   ),
//                 ),