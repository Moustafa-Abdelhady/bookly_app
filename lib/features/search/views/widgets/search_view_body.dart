import 'package:book_store/features/home/data/models/book_model/book_model.dart';
import 'package:book_store/features/home/data/models/book_model/volume_info.dart';
import 'package:book_store/features/home/presentaion/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/widgets/custom_error_widget.dart';
// import '../../../../core/widgets/custom_loading_indecator_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../splash/presentation/views/widgets/best_seller_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, });

  // final BookModel bookModel;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const CustomSearchTextField(bookModel: BookModel(volumeInfo: VolumeInfo())),
          const SizedBox(
            height: 16,
          ),
          Text(S.of(context).favBooks),
          const SizedBox(
            height: 12,
          ),
         const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
        builder: (context, state) {
      if (state is SearchBooksSuccess) {
        return ListView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding:const EdgeInsets.symmetric(vertical: 5),
              child: BestSellerListViewItem(
                bookModel: state.books[index]
             
              ),
             
            );
          },
         
        );
      } else if (state is SearchBooksFailure) {
        return CustomErrorWidget(
          errMessage: state.errMessage,
        );
      } else {
        return  const Center(
          child:Text(''),
        );
      }
    });
  }
}

//  Shimmer.fromColors(
//                             baseColor: Colors.grey[850]!,
//                             highlightColor: Colors.grey[800]!,
//                             child: Container(
//                               height: 170.0,
//                               width: 120.0,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
