import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

import '../../../../../../core/common_ui/widgets/app_text_field.dart';
import '../../logic/search_keywords/search_keywords_notifier.dart';

class SearchImagesTextField extends ConsumerWidget {
  const SearchImagesTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(searchImagesNotifierProvider.notifier);
    searchProvider.searchImagesController.text =
        searchProvider.searchKewordsController.text;
    return Expanded(
      child: AppTextField(
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // do search
          },
        ),
        onSubmitted: (p0) {
          //do search
        },
        hintText: context.translate.search,
        autofocus: false,
        controller: searchProvider.searchImagesController,
      ),
    );
  }
}
