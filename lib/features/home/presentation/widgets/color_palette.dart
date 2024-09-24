
import 'package:flutter/material.dart';

import '../../../../core/helpers/color_palettes.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Row(
        children: [
          for (final color in ColorPalettes.colorPalette)
            Expanded(
              child: Container(
                color: color,
                height: 300,
              ),
            ),
        ],
      ),
    );
  }
}
