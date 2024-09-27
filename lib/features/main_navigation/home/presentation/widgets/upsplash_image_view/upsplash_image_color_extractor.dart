import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

import '../../../../../../core/helpers/app_assets.dart';
import '../../../data/models/upsplash_image_model.dart';
import 'upsplash_image_color_presenter.dart';

class UpsplashImageColorExtractor extends StatefulWidget {
  const UpsplashImageColorExtractor({super.key, required this.image});
  final UpsplashImageModel image;

  @override
  State<UpsplashImageColorExtractor> createState() =>
      _UpsplashImageColorExtractorState();
}

class _UpsplashImageColorExtractorState
    extends State<UpsplashImageColorExtractor> {
  PaletteGenerator? _paletteGenerator;
  Color? dominantColor;
  Color? lightVibrantColor;
  Color? lightMutedColor;

  @override
  void initState() {
    super.initState();
    _extractColorsFromImage();
  }

  Future<void> _extractColorsFromImage() async {
    final imageUrl = widget.image.urls?.small ??
        AppAssets
            .personNetwrokImagePlaceHolder; // Replace with your network image URL
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
    );

    setState(() {
      _paletteGenerator = paletteGenerator;
      dominantColor = _paletteGenerator?.dominantColor?.color;
      lightVibrantColor = _paletteGenerator?.lightVibrantColor?.color;
      lightMutedColor = _paletteGenerator?.lightMutedColor?.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.r),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (dominantColor != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UpsplashImageColorPresenter(
                    color: widget.image.color ?? Colors.green,
                  ),
                  horizontalSpace(10),
                  UpsplashImageColorPresenter(
                    color: dominantColor ?? Colors.green,
                  ),
                  horizontalSpace(10),
                  UpsplashImageColorPresenter(
                    color: lightVibrantColor ?? Colors.black,
                  ),
                  horizontalSpace(10),
                  UpsplashImageColorPresenter(
                    color: lightMutedColor ?? Colors.green,
                  ),
                ],
              ),
          ],
        ),
      );
  }
}
