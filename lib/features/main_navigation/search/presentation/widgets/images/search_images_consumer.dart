import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/logic/search_keywords/search_keywords_notifier.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/logic/search_keywords/search_keywords_state.dart';

import '../../../../../../core/common_ui/widgets/custom_error.dart';
import '../../../../home/presentation/widgets/home_view/upsplash_images_gridview_builder.dart';
import '../../../../home/presentation/widgets/home_view/upsplash_images_loading_gridview.dart';

class SearchImagesConsumer extends ConsumerWidget {
  const SearchImagesConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchImagesNotifierProvider);
    final notifier = ref.read(searchImagesNotifierProvider.notifier);

    if (state is SearchImagesSuccess) {
      return Expanded(
        child: UpsplashImagesGridViewBuilder(
          images: notifier.images,
          scrollController: notifier.scrollController,
        ),
      );
    } else if (state is SearchImagesLoading) {
      return const UpsplashImagesLoadingGridview();
    } else if (state is SearchImagesError) {
      return RefreshIndicator(
        onRefresh: () => notifier.searchImages(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: CustomError(
            error: state.error,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
