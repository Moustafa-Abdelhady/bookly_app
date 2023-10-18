import 'package:book_store/features/home/presentaion/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

import '../../../data/models/book_model/book_model.dart';

import 'books_button_action.dart';
import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';


class BooksDetailsViewBody extends StatelessWidget {
  const BooksDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    ////we can't use SingleChildScrollView because we use expanded so
    /// CustomScrollView => makes scrollview takes => slivers[] =>
    /// SliverFillRemaining => takes scroll view with expanded
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children:  [
               const CustomBookDetailsAppBar(),
                BookDetailsSection(book:bookModel,),
               const SizedBox(height: 16),
                BooksAction(
                bookModel: bookModel,
               ),
               const Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
               const SimilarBooksSection(),
               const SizedBox(height: 15),
              ],
            ),
          ),
        )
      ],
    );
  }
}
