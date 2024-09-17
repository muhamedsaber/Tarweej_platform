import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tarweej_platform/features/create/pic_selector/logic/media_loader_state.dart';

import '../../../../core/helpers/media_helper.dart';

class MediaLoaderNotifier extends StateNotifier<MediaLoaderState> {
  MediaLoaderNotifier() : super(MediaLoaderInitialState());

  List<AssetPathEntity> albums = [];
  AssetPathEntity? selectedAlbum;
  int allImagesPage = 0;
  int albumImagesPage = 0;
  int size = 50;

  /// This method is used to retrieve all media [images] albums from device
  loadAlbums() async {
    state = MediaLoaderLoadingState();
    albums = await MediaHelper.loadAllAlbums();
  }

  /// This method is used to retrieve all [images] inside all [albums]
  /// The album property is optional, use it to specify a specific album.
  loadImages() async {
    // state = MediaLoaderLoadingState();
    // if (album == null) {
    //   _loadAllImages();
    // } else {
    //   _loadImagesForSpecificAlbum(album);
    // }
    _loadAllImages();
  }

  //------------Helper Functions

  /// Loads all images across all albums
  _loadAllImages() async {
    final List<AssetEntity> existingImages = await _loadPreviewedImages();

    final List<AssetEntity> newImages = await MediaHelper.loadAllImages(
        page: allImagesPage, numberOfImages: size);

    // Updating state after fetching images

    state = MediaLoaderLoadedState(photos: [...existingImages, ...newImages]);

    // Increment the page for the next pagination request
    allImagesPage++;
  }

  // /// Loads images from a specific album
  // _loadImagesForSpecificAlbum(AssetPathEntity album) async {
  //   if (selectedAlbum != album) {
  //     albumImagesPage = 0;
  //   }
  //   selectedAlbum = album;

  //   final List<AssetEntity> existingImages = await _loadPreviewedImages();

  //   List<AssetEntity> newImages = await MediaHelper.loadImagesForAlbum(
  //       album: album, page: albumImagesPage, size: size);

  //   // Updating state after fetching images
  //   state = MediaLoaderLoadedState(photos: [...existingImages, ...newImages]);

  //   // Increment the page for the next pagination request
  //   albumImagesPage++;
  // }

  /// Retrieves the list of previously loaded images
  Future<List<AssetEntity>> _loadPreviewedImages() async {
    if (state is MediaLoaderLoadedState) {
      return (state as MediaLoaderLoadedState).photos;
    }
    return [];
  }

  // /// Resets the album selection
  // resetAlbum() {
  //   selectedAlbum = null;
  //   albumImagesPage = 0;
  // }
}

// MediaSelectorProvider
final mediaLoaderNotifier =
    StateNotifierProvider<MediaLoaderNotifier, MediaLoaderState>(
        (ref) => MediaLoaderNotifier()
          ..loadAlbums()
          ..loadImages());
