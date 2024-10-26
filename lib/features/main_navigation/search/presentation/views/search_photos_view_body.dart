import 'package:flutter/material.dart';

import '../../../../../core/helpers/size.dart';

import '../widgets/keywords/search_keywords_consumer.dart';

class SearchPhotosViewBody extends StatelessWidget {
  const SearchPhotosViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          verticalSpace(10),
          const SearchKeywordsConsumer(),
        ],
      ),
    );
  }
}
