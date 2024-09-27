import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

part 'storage_permission_state.dart';

class StoragePermissionNotifier extends StateNotifier<StoragePermissionState>
    with WidgetsBindingObserver {
  StoragePermissionNotifier() : super(StoragePermissionInitialState()) {
    WidgetsBinding.instance.addObserver(this);
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
      getStorageStatus();
    }
  }

  // Fetch the current permission status based on API level
  Future<void> getStorageStatus() async {
    state = StoragePermissionLoading();
    PermissionStatus status;

    if (Platform.isAndroid) {
      status = await Permission.storage.status;
    } else {
      return;
    }

    _changePermissionStatus(status);
  }

  // Request permissions based on API level
  Future<void> requestStoragePermission() async {
    PermissionStatus status;

    status = await Permission.storage.request();

    _changePermissionStatus(status);
  }

  // Change the permission status based on the request result
  void _changePermissionStatus(PermissionStatus status) {
    log("Permission status: $status");

    switch (status) {
      case PermissionStatus.granted:
        state = StoragePermissionGranted();
        break;
      case PermissionStatus.permanentlyDenied:
        state = StoragePermissionPermanentlyDenied();
        break;
      default:
        state = StoragePermissionDenied();
        break;
    }
  }

  openSettings() async {
    await openAppSettings();
    getStorageStatus();
  }
}

final storagePermissionProvider =
    StateNotifierProvider<StoragePermissionNotifier, StoragePermissionState>(
  (ref) {
    return StoragePermissionNotifier();
  },
);
