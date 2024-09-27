
import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

class BottomNavBarIndicator extends StatelessWidget {
  const BottomNavBarIndicator({
    super.key,
    required this.tapsCount,
    required this.currentIndex,
    this.paddingValue = 0,
    this.height = 4.0,
    this.indicatorColor,
    this.borderRadius = const BorderRadius.only(
      bottomRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
    ),
    this.animationDuration = const Duration(milliseconds: 340),
    this.animationCurve = Curves.easeInOut,
  });

  final int tapsCount;
  final int currentIndex;

  final double paddingValue;
  final double height;
  final Color? indicatorColor;
  final BorderRadius borderRadius;
  final Duration animationDuration;
  final Curve animationCurve;

  @override
  Widget build(BuildContext context) {
    final TextDirection direction = Directionality.of(context);

    final tapWidth = ((context.screenWidth - paddingValue) / tapsCount);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingValue),
      child: AnimatedContainer(
        duration: animationDuration,
        curve: animationCurve,
        height: height,
        width: tapWidth,
        margin: getIndicatorPosition(
          context: context,
          currentIndex: currentIndex,
          direction: direction,
          tapsCount: tapsCount,
          tapWidth: tapWidth,
        ),
        decoration: BoxDecoration(
          color: indicatorColor ?? Theme.of(context).primaryColor,
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  EdgeInsets getIndicatorPosition({
    required BuildContext context,
    required TextDirection direction,
    required int currentIndex,
    required int tapsCount,
    required double tapWidth,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final spaceFromLeft = tapWidth * currentIndex;
    final spaceFromRight =
        (screenWidth - paddingValue) - spaceFromLeft - tapWidth;

    if (direction == TextDirection.ltr) {
      return EdgeInsets.only(left: spaceFromLeft, right: spaceFromRight);
    } else {
      return EdgeInsets.only(right: spaceFromLeft, left: spaceFromRight);
    }
  }
}
