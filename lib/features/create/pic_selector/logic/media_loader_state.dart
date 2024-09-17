// Unified State
import 'package:photo_manager/photo_manager.dart';

abstract class MediaLoaderState {}

class MediaLoaderInitialState extends MediaLoaderState {}

class MediaLoaderLoadingState extends MediaLoaderState {}

class MediaLoaderLoadedState extends MediaLoaderState {
  final List<AssetEntity> photos;

  MediaLoaderLoadedState({required this.photos});
}

class MediaLoaderFaliureState extends MediaLoaderState {}
