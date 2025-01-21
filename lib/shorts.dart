// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:reels_viewer/reels_viewer.dart';
//
// class YtShorts extends StatefulWidget {
//   const YtShorts({super.key});
//
//   @override
//   State<YtShorts> createState() => _YtShortsState();
// }
//
// class _YtShortsState extends State<YtShorts> {
//   List<ReelModel> reelsList =[
//     ReelModel(
//         "https://youtube.com/shorts/AOoZY1f3K-0?si=SGGdXZxf6U-JlxF6",
//         "coding Is Life",
//         likeCount: 2000,
//         isLiked: true,
//         musicName: "In the name of Love",
//         reelDescription: "Life is better when you're laughing",
//         profileUrl:"https://www.youtube.com/user/tech_guru56/",
//         commentList: [
//           ReelCommentModel(comment: "Nice",
//             userProfilePic: "https://www.instagram.com/john_doe123/",
//             userName: "Darshan",
//             commentTime: DateTime.now(),
//           ),
//           ReelCommentModel(comment:"super...",
//             userProfilePic: "https://www.instagram.com/david_martin_007/",
//             userName: "Jhon",
//             commentTime: DateTime.now(),
//           ),
//           ReelCommentModel(comment:"great",
//             userProfilePic: "https://www.instagram.com/alyssa.brown_99/",
//             userName: "Muzu",
//             commentTime: DateTime.now(),
//           ),
//
//         ]),
//     ReelModel(
//       "https://youtube.com/shorts/AOoZY1f3K-0?si=SGGdXZxf6U-JlxF6",
//       "Rahul",
//       musicName: "In the name of Love",
//       reelDescription: "Life is better when you're laughing",
//       profileUrl: "https://www.instagram.com/john_doe123/",
//     ),
//     ReelModel(
//       "https://youtube.com/shorts/AOoZY1f3K-0?si=SGGdXZxf6U-JlxF6",
//       "Rahul",
//     ),
//   ];
//   get comment =>null;
//   get index =>null;
//   @override
//   Widget build(BuildContext context) {
//     return ReelsViewer(
//       reelsList: reelsList,
//       appbarTitle: "YouTube Shorts",
//       onShare: (url){
//         log("Shared reel url ==> $url" as num);
//       },
//       onLike: (url){
//         log("Liked reel url ==> $url" as num);
//       },
//       onFollow: (){
//         log("=====> Clicked on follow <=====" as num);
//       },
//       onComment: (comment){
//         log("Comment on reel ===> $comment" as num);
//       },
//       onClickMoreBtn: (){
//         log("=======> Clicked on more options <=======" as num);
//       },
//       onClickBackArrow: (){
//         log("=======> Clicked on the back arrow <=======" as num);
//       },
//       onIndexChanged: (index){
//         log("======> Current Index ======> $index <======" as num);
//         if((reelsList.length - 1)== index) {
//           log("Load more" as num);
//         }
//       },
//       showProgressIndicator: false,
//       showAppbar: true,
//       showVerifiedTick: true,
//
//
//     );
//   }
// }