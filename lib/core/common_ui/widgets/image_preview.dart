import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview(
      {super.key, required this.lowerSizeImage, required this.asset});
  final Widget lowerSizeImage; // Thumbnail image to display in Grid
  final AssetEntity asset; // Asset to load full image in Preview mode

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview>
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
        _showImagePreviewDialog(
            context); // Show the full image when long-pressed
      },
      onLongPressEnd: (details) {
        _closeImagePreviewDialog(); // Close the preview when released
      },
      child: widget.lowerSizeImage, // Show the thumbnail in the grid
    );
  }

  void _showImagePreviewDialog(BuildContext context) {
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
          ScaleTransition(
            scale: _animationController,
            child: FutureBuilder<Uint8List?>(
                future: widget.asset.originBytes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.memory(
                        snapshot.data!,
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          )
        ],
      ),
    );

    Overlay.of(context).insert(_dialogOverlayEntry!);
  }

  void _closeImagePreviewDialog() async {
    await _animationController.reverse();
    _dialogOverlayEntry?.remove();
    _dialogOverlayEntry = null;
  }
}
