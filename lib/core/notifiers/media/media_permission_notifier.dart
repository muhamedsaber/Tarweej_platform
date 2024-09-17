import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../helpers/device_info_helper.dart';

part "media_permission_state.dart";

class MediaPermissionNotifier extends StateNotifier<MediaPermissionState>
    with WidgetsBindingObserver {
  MediaPermissionNotifier() : super(MediaPermissionInitialState()) {
    WidgetsBinding.instance.addObserver(this);
    getMediaStatus();
  }

  /// This method is called when the object is disposed
  @override
  void dispose() {
    // Removing the observer when the object is disposed
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

// After user goes to settings and comes back, this method will be called
// to refresh the permission status if the permission was granted it will change the state
// then i should load assets
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // The app has resumed, so check for permission changes
      getMediaStatus();
    }
  }

  // Fetch the current permission status based on API level
  Future<void> getMediaStatus() async {
    state = MediaPermissionLoading();
    PermissionStatus status;

    if (Platform.isAndroid) {
      final apiLevel = await DeviceInfoHelper.getAndroidApiLevel();
      status = (apiLevel != null && apiLevel >= 30)
          ? await Permission.photos.status
          : await Permission.storage.status;
    } else {
      status = await Permission.photos.status;
    }

    _changePermissionStatus(status);
  }

  // Request permissions based on API level
  Future<void> requestMediaPermission() async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      final apiLevel = await DeviceInfoHelper.getAndroidApiLevel();
      status = (apiLevel != null && apiLevel >= 30)
          ? await Permission.photos.request()
          : await Permission.storage.request();
    } else {
      status = await Permission.photos.request();
    }

    _changePermissionStatus(status);
  }

  // Change the permission status based on the request result
  void _changePermissionStatus(PermissionStatus status) {
    log("Permission status: $status");

    switch (status) {
      case PermissionStatus.granted:
        state = MediaPermissionGranted();
        break;
      case PermissionStatus.permanentlyDenied:
        state = MediaPermissionPermanentlyDenied();
        break;
      default:
        state = MediaPermissionDenied();
        break;
    }
  }

  openSettings() async {
    await openAppSettings();
    getMediaStatus();
  }
}

final mediaPermissionProvider =
    StateNotifierProvider<MediaPermissionNotifier, MediaPermissionState>(
  (ref) {
    return MediaPermissionNotifier();
  },
);
