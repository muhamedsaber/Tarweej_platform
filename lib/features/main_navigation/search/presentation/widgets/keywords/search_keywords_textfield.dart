import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/logic/search_keywords/search_keywords_notifier.dart';

import '../../../../../../core/common_ui/widgets/app_text_field.dart';
import '../../../../../../core/helpers/size.dart';

class SearchKeywordsTextField extends ConsumerWidget {
  const SearchKeywordsTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(searchImagesNotifierProvider.notifier);

    /// This is the notifier that toggles the search bar to change the ui
    final toggleSearchNotifier = ref.watch(toggleSearchProvider.notifier);
    final isSearchActive = ref.watch(toggleSearchProvider);

    return Row(
      children: [
        horizontalSpace(10),
        Expanded(
          child: TweenAnimationBuilder(
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(value, 0),
                child: child,
              );
            },
            tween: Tween<double>(begin: 0, end: isSearchActive ? 10 : 0),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            child: GestureDetector(
                key: ValueKey(isSearchActive),
                onTap: () {
                  toggleSearchNotifier.state = !toggleSearchNotifier.state;
                },
                child: AppTextField(
                  onChanged: (p0) {
                    searchProvider.searchKeywords(p0);
                  },
                  controller: searchProvider.searchKewordsController,
                  isButton: !isSearchActive,
                  hintText: context.translate.search,
                  autofocus: isSearchActive,
                )),
          ),
        ),
        if (isSearchActive) horizontalSpace(10),
        if (isSearchActive)
          IconButton(
            onPressed: () {
             toggleSearchNotifier.state = !toggleSearchNotifier.state;
            },
            icon: Icon(
              Icons.close,
              color: context.theme.colorScheme.onSurface,
            ),
          ),
        horizontalSpace(10),
      ],
    );
  }

 
}

final toggleSearchProvider = StateProvider<bool>(
  (ref) => false,
);
