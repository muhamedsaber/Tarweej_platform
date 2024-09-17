import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/create/pic_selector/logic/media_loader_state.dart';
import 'package:tarweej_platform/features/create/pic_selector/widgets/images_grid_view.dart';

import '../logic/media_loader_notifier.dart';

class MediaConsumer extends ConsumerStatefulWidget {
  const MediaConsumer({super.key});

  @override
  ConsumerState<MediaConsumer> createState() => _MediaConsumerState();
}

class _MediaConsumerState extends ConsumerState<MediaConsumer> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      await _loadMorePhotos();
    }
  }

  Future<void> _loadMorePhotos() async {
    ref.read(mediaLoaderNotifier.notifier).loadImages();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mediaLoaderNotifier);
    log(state.toString());
    if (state is MediaLoaderLoadedState) {
      log(state.photos.length.toString());
      return ImagesGridViewBuilder(
        photos: state.photos,
        controller: _scrollController,
      );
    } else if (state is MediaLoaderLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MediaLoaderFaliureState) {
      return Text(context.translate.somethingWentWrong);
    } else {
      return const SizedBox();
    }
  }
}
