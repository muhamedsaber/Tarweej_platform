import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';

class AppToasts {
  static final List<OverlayEntry?> _overlaies = [];

  static void showToast({
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
    ToastPosition position = ToastPosition.bottom,
    Color? backgroundColor,
  }) {
    // Resolve background color or use default theme color.
    final Color color = backgroundColor ?? Theme.of(context).primaryColor;

    // Declare the overlay entry variable first.
    late final OverlayEntry overlayEntry;

    // Initialize the overlay entry.
    overlayEntry = OverlayEntry(
      builder: (context) {
        // Determine position based on the selected ToastPosition.
        double? top, bottom;
        switch (position) {
          case ToastPosition.top:
            top = 50.h;
            break;
          case ToastPosition.bottom:
            bottom = 50.h;
            break;
          case ToastPosition.center:
            top = MediaQuery.of(context).size.height / 2 - 50.h;
            break;
        }
        return Positioned(
          right: 0,
          left: 0,
          top: top,
          bottom: bottom,
          child: Material(
            color: Colors.transparent,
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                // Remove the specific overlay on swipe.
                _removeOverlay(overlayEntry);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10000),
                ),
                child: Text(
                  message,
                  style: Theme.of(context).font14OnSurfaceMedium.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        );
      },
    );

    // Add the overlay and manage its lifetime.
    _addNewOverlay(context, overlayEntry, duration);
  }

  static void _clearOldOverlaies() {
    for (var element in _overlaies) {
      if (element != null && element.mounted) {
        element.remove();
      }
    }
    _overlaies.clear();
  }

  static void _addNewOverlay(
      BuildContext context, OverlayEntry overlay, Duration duration) {
    // Remove existing overlays before adding a new one.
    _clearOldOverlaies();
    _overlaies.add(overlay);
    Overlay.of(context, rootOverlay: true).insert(overlay);
    Future.delayed(duration, () {
      // Remove the overlay after the specified duration.
      _removeOverlay(overlay);
    });
  }

  static void _removeOverlay(OverlayEntry overlay) {
    if (overlay.mounted) {
      overlay.remove();
      _overlaies.remove(overlay);
    }
  }
}

enum ToastPosition { top, bottom, center }
