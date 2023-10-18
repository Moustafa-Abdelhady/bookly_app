import 'package:book_store/core/widgets/custom_error_widget.dart';
import 'package:book_store/core/widgets/custom_loading_indecator_widget.dart';
import 'package:book_store/features/home/presentaion/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../splash/presentation/views/widgets/best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});


  @override
  Widget build(BuildContext context) {
    // return Container(
    // alignment: Alignment.bottomLeft,
    // height: 260,
    // child:
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksSuccess) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding:const EdgeInsets.symmetric(vertical: 5),
              child: BestSellerListViewItem(
                bookModel: state.books[index],
              ),
            );
          },
          // ),
        );
      } else if (state is NewestBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const Center(child: CustomLoadingIndecator());
      }
    });
  }

  
}
