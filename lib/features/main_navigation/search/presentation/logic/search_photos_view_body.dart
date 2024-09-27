import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/widgets/search_images_textfield.dart';


class SearchPhotosViewBody extends StatelessWidget {
  const SearchPhotosViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          verticalSpace(10),
          const SearchImagesTextField()
          
        ],
      ),
    );
  }
}
