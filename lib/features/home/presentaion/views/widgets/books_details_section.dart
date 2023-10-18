import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'book_rating.dart';
import 'custom_list_view_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
   
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .25,
          ),
          child:  CustomLisViewImage(
            imageUrl:
            // net[0]
              book.volumeInfo.imageLinks?.thumbnail ??  'https://th.bing.com/th/id/R.ecee656c66d2ef6aeece87267e528809?rik=Y65mjlkSn8O8Vg&pid=ImgRaw&r=0' ,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          book.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
        ),
        const SizedBox(height: 7),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors?[0] ?? 'The Jungle Book ',
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 14),
         BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating ?? 4.5,
          count: book.volumeInfo.ratingsCount ?? 245,
        ),
      ],
    );
  }
}
 