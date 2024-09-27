import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/core/helpers/app_assets.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/main_navigation/home/data/models/upsplash_image_model.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/widgets/upsplash_image_view/open_upsplash_image_in_webview_button.dart';
import 'package:tarweej_platform/features/main_navigation/home/presentation/widgets/upsplash_image_view/share_upsplash_image_button.dart';

class UpsplashImagePreviewer extends StatefulWidget {
  const UpsplashImagePreviewer(
      {super.key, required this.image, required this.child});
  final UpsplashImageModel image;
  final Widget child;
  @override
  State<UpsplashImagePreviewer> createState() => _UpsplashImagePreviewerState();
}

class _UpsplashImagePreviewerState extends State<UpsplashImagePreviewer>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _dialogOverlayEntry;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 130),
      reverseDuration: const Duration(milliseconds: 130),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _showNetwrokImagePreviewerDialog(
            context); // Show the full image when long-pressed
      },

      child: widget.child, // Show the thumbnail in the grid
    );
  }

  void _showNetwrokImagePreviewerDialog(BuildContext context) {
    _animationController.forward(); // Start the animation

    _dialogOverlayEntry = OverlayEntry(
      builder: (context) => Stack(
        alignment: Alignment.center,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ScaleTransition(
                scale: _animationController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        )),
                    Image.network(
                      widget.image.urls?.small ??
                          AppAssets.personNetwrokImagePlaceHolder,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShareUpsplashImageButton(
                            image: widget.image,
                            onShare: () {
                              _closeNetwrokImagePreviewerDialog();
                            },
                          ),
                          OpenUpsplashImageInWebViewButton(
                            url: widget.image.links?.html,
                            onOpen: () {
                              _closeNetwrokImagePreviewerDialog();
                            },
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30.h,
                      ),
                      onPressed: () {
                        _closeNetwrokImagePreviewerDialog();
                      },
                    )
                  ],
                ),
              ))
        ],
      ),
    );

    Overlay.of(context).insert(_dialogOverlayEntry!);
  }

  void _closeNetwrokImagePreviewerDialog() async {
    await _animationController.reverse();
    _dialogOverlayEntry?.remove();
    _dialogOverlayEntry = null;
  }
}
