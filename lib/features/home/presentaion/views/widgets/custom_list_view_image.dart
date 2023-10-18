import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class CustomLisViewImage extends StatelessWidget {
  const CustomLisViewImage({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          // width / height
          aspectRatio: 1 / 1.2,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            placeholder: (context, url) =>  Shimmer.fromColors(
                            baseColor:const Color.fromARGB(255, 99, 96, 96),
                            highlightColor:const Color.fromARGB(255, 128, 125, 125),
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),),
             errorWidget: (context, url, error) => const Icon(Icons.error),
           
          )
          // Container(
          //   // width:150,
          //   // height: MediaQuery.of(context).size.height * .25,
          //   decoration: BoxDecoration(
          //     // color: Colors.red,
          //     borderRadius: BorderRadius.circular(16),
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image:NetworkImage(
          //         imageUrl,
          //         // scale:.03
          //       ),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
