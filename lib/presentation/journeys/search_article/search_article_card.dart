// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../../../common/constants/route_constants.dart';
// import '../../../common/constants/size_constants.dart';
// import '../../../common/extensions/size_extensions.dart';
// import '../../../data/core/api_constants.dart';
// import '../../../domain/entities/article_entity.dart';
// import '../../themes/theme_text.dart';
// import '../article_details/article_detail_arguments.dart';
//
// class SearchArticleCard extends StatelessWidget {
//   final ArticleEntity article;
//
//   const SearchArticleCard({
//     Key? key,
//     required this.article,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).pushNamed(
//           RouteList.articleDetail,
//           arguments: ArticleDetailArguments(article.id),
//         );
//
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: Sizes.dimen_16.w,
//           vertical: Sizes.dimen_2.h,
//         ),
//         child: Row(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(Sizes.dimen_8.w),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
//                 child: CachedNetworkImage(
//                   imageUrl: article.yoastHeadJson!.ogImage![0].url!,
//                   width: Sizes.dimen_80.w,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     article.yoastHeadJson!.title!,
//                     style: TextStyle(
//                         height: 1.5,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         overflow: TextOverflow.fade,
//                         fontSize: 12.0),
//                   ),
//                   Text(
//                     article.yoastHeadJson!.ogDescription!,
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                         height: 1.5,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         overflow: TextOverflow.fade,
//                         fontSize: 12.0),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
