import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/widgets/images/search_images_consumer.dart';
import '../widgets/images/search_images_textfield.dart';

class SearchImagesResultView extends StatelessWidget {
  const SearchImagesResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.screenHorizontal23,
        child: Column(
          children: [
            verticalSpace(10),
            Row(
              children: [
                horizontalSpace(10),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                const SearchImagesTextField(),
                horizontalSpace(20)
              ],
            ),
            SearchImagesConsumer()
          ],
        ),
      ),
    );
  }
}
