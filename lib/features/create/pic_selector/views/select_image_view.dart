import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/create/pic_selector/widgets/select_image_view_body.dart';

class SelectImageView extends StatelessWidget {
  const SelectImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.theme.colorScheme.surface,
        title: Text(
          context.translate.select,
          style: context.theme.font25OnSurfaceMedium,
        ),
        leading: IconButton(
          onPressed: () {
            context.navigateBack();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: const SelectImageViewBody(),
    );
  }
}
