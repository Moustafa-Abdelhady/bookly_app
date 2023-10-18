import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:CircularProgressIndicator(),
    // Opacity(
    //   opacity: 0.8,
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(16),
    //     child: AspectRatio(
    //         // width / height
    //         aspectRatio: 1 / 1.2,
    //         child: 
    //           Container(
    //             decoration: BoxDecoration(
    //                             color: Colors.black,
    //                             borderRadius: BorderRadius.circular(8.0),
    //                           ),
    //             child: CachedNetworkImage(
    //               width:90,
    //               fit: BoxFit.fill,
    //               imageUrl: 'https://th.bing.com/th/id/R.ecee656c66d2ef6aeece87267e528809?rik=Y65mjlkSn8O8Vg&pid=ImgRaw&r=0',
    //               // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    //                errorWidget: (context, url, error) => const Icon(Icons.error),
    //               // placeholder: (context, url) => 
    //             ),
    //           )
           
    //         ),
    //   ),
    // ),
    );
  }
}
