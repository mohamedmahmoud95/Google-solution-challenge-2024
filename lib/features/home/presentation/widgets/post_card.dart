//
//
// import 'package:flutter/material.dart';
//
// class PostCard extends StatelessWidget {
//
//   const PostCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: Colors.red,
//                 radius: 20.,
//                 child: const Icon(
//                   Icons.person,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(
//                 width: 10.w,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "user_name".tr(context),
//                     style: quicksand16W500(),
//                   ),
//                   SizedBox(
//                     height: 2.h,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         '8h . ',
//                         style: GoogleFonts.poppins(
//                           fontSize: 10.sp,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Image.asset(
//                         AppImages.earth,
//                         width: 10.w,
//                         height: 10.h,
//                         color: Colors.grey,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Icon(Icons.more_horiz),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     const Icon(Icons.close),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   model.title ?? "",
//                   style: quicksand18(),
//                 ),
//                 SizedBox(
//                   height: 8.h,
//                 ),
//                 Text(
//                   model.body ?? "",
//                   style: quicksand16W500(),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 60.h,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 top: 30.h,
//                 bottom: 10.h,
//                 right: 10.w,
//                 left: 10.w,
//               ),
//               child: Row(
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(
//                         AppImages.like,
//                       ),
//                       SizedBox(
//                         width: 5.w,
//                       ),
//                       Text(
//                         '16',
//                         style: quicksand12W300grey(),
//                       )
//                     ],
//                   ),
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           '16',
//                           style: quicksand12W300grey(),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text('comments'.tr(context),
//                             style: quicksand12W300grey()),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             height: 40.h,
//             decoration: BoxDecoration(
//                 border: Border(
//                     top: BorderSide(
//                       color: Colors.grey,
//                       width: 1.w,
//                     ))),
//             padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
//             alignment: Alignment.center,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 LikeCommentShare(AppImages.singleLike, 'like'.tr(context)),
//                 LikeCommentShare(AppImages.comment, 'comment'.tr(context)),
//                 LikeCommentShare(AppImages.share, 'share'.tr(context)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
