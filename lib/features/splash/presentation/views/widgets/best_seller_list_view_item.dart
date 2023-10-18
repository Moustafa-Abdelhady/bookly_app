
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../constans.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/data/models/book_model/book_model.dart';
import '../../../../home/presentaion/views/widgets/book_rating.dart';
import '../../../../home/presentaion/views/widgets/custom_list_view_image.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});

    final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView , extra:bookModel );
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
           
            // for(var i=0 ;i < net.length-4 ;i++)
                CustomLisViewImage(
             imageUrl:bookModel.volumeInfo.imageLinks?.smallThumbnail ?? 'https://th.bing.com/th/id/OIP.GZfrgP79dmsyndsOpAh-SgHaFj?pid=ImgDet&rs=1',
            //  imageUrl:net[i] ,
                ),
            // AspectRatio(
            //   // width / height
            //   aspectRatio: 2.7 / 4,
            //   child: Container(
            //     // width:150,
            //     // height: MediaQuery.of(context).size.height * .25,
            //     decoration: BoxDecoration(
            //       color: Colors.red,
            //       borderRadius: BorderRadius.circular(8),
            //       image: const DecorationImage(
            //         fit: BoxFit.fill,
            //         image: AssetImage(AssetsData.testImage),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGtSectraFine),
                    ),
                  ),
                  const SizedBox(height: 4),
                   Text(
                    bookModel.volumeInfo.authors?[0] ?? 'John Doe',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:Styles.textStyle14,
                    
                    
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                      getPrice(bookModel , context),
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                       BookRating(
                        rating: bookModel.volumeInfo.averageRating ?? 4.5,
                        count: bookModel.volumeInfo.ratingsCount ?? 245,
                       ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   String getPrice(BookModel bookModel , context) {
    if (bookModel.saleInfo!.saleability == "FOR_SALE") {
      return "${bookModel.saleInfo!.listPrice!.amount} ${bookModel.saleInfo!.listPrice!.currencyCode}";
    } else {
      return S.of(context).free;
    }
  }
}
