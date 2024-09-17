import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/notifiers/media/media_permission_notifier.dart';
import 'all_images_consumer.dart';
import 'media_permission_not_granted.dart';

class SelectImageViewBody extends ConsumerWidget {
  const SelectImageViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mediaPermissionProvider);
    if (state is MediaPermissionLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is MediaPermissionGranted) {
      return const MediaConsumer();
    } else if (state is MediaPermissionDenied) {
      return MediaPermissionNotGranted(
          status: PermissionStatus.denied, ref: ref);
    } else if (state is MediaPermissionPermanentlyDenied) {
      return MediaPermissionNotGranted(
          status: PermissionStatus.permanentlyDenied, ref: ref);
    } else {
      return const SizedBox();
    }
  }
}
