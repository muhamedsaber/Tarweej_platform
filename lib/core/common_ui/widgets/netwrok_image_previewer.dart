import 'dart:ui';

import 'package:flutter/material.dart';

class NetwrokImagePreviewer extends StatefulWidget {
  const NetwrokImagePreviewer({super.key, required this.image,required this.child});
  final String image;
  final Widget child;
  @override
  State<NetwrokImagePreviewer> createState() => _NetwrokImagePreviewerState();
}

class _NetwrokImagePreviewerState extends State<NetwrokImagePreviewer>
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
      onLongPressEnd: (details) {
        _closeNetwrokImagePreviewerDialog(); // Close the preview when released
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
          ScaleTransition(
            scale: _animationController,
            child: Image.network(widget.image),
          )
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
