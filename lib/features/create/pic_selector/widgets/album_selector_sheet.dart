import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
// import 'package:tarweej_platform/features/create/pic_selector/logic/albums_notifier.dart/album_notifier.dart';

import '../logic/media_loader_notifier.dart';

// class AlbumSelectorSheet extends ConsumerWidget {
//   const AlbumSelectorSheet({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final notifier = ref.watch(mediaLoaderNotifier.notifier);

//     return AlbumsGridViewBuilder(
//       albums: notifier.albums,
//     );
//   }
// }

// class AlbumsGridViewBuilder extends ConsumerWidget {
//   const AlbumsGridViewBuilder({super.key, required this.albums});
//   final List<AssetPathEntity> albums;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final mediaNotifier = ref.watch(mediaLoaderNotifier.notifier);
//     return GridView.builder(
//       itemCount: albums.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         crossAxisSpacing: 2.0,
//         mainAxisSpacing: 2.0,
//       ),
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {
//             mediaNotifier.loadImages(album:albums[index]);
//             Navigator.pop(context);
//           },
//           child: Container(
//             color: Colors.grey,
//             child: Center(
//               child: Text(albums[index].name),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
