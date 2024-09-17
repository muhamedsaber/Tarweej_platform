import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/create/pic_selector/logic/media_loader_notifier.dart';
import 'package:tarweej_platform/features/create/pic_selector/widgets/album_selector_sheet.dart';

// class AlbumChangerButton extends StatelessWidget {
//   const AlbumChangerButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return const AlbumSelectorSheet();
//         },
//       ),
//       child: Container(
//         height: 40.h,
//         margin: EdgeInsets.only(left: 30.w),
//         child: Row(
//           children: [
//             Consumer(
//               builder: (context, ref, child) {
//                 final notifier = ref.watch(mediaLoaderNotifier.notifier);

//                 return Text(
//                     notifier.selectedAlbum?.name ?? context.translate.recent);
//               },
//             ),
//             horizontalSpace(10),
//             const Icon(Icons.arrow_back_ios),
//           ],
//         ),
//       ),
//     );
//   }
// }
