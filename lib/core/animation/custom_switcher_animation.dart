import 'package:flutter/material.dart';

class CustomSwitcherAnimation extends StatelessWidget {
  const CustomSwitcherAnimation(
      {super.key,
      required this.firstChild,
      required this.secondChild,
      required this.isSwitched});
  final Widget firstChild;
  final Widget secondChild;
  final bool isSwitched;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
            scale: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ));
      },
      child: isSwitched ? firstChild : secondChild,
    );
  }
}

// TODO: Implement the logic for switching between fade transition
// and scale transition based on the selected SwitcherAnimationType.

enum SwitcherAnimationType { fadeTransition, scaleTransition }
