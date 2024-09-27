import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

AppBar homeViewAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      context.translate.home,
      style: context.theme.font25OnSurfaceMedium,
    ),
  );
}
