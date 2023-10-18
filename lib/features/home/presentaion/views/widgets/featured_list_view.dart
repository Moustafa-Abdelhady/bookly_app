import 'package:book_store/features/home/presentaion/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indecator_widget.dart';
import 'custom_list_view_image.dart';

class FeaturedBoxListView extends StatelessWidget {
  // const FeaturedBoxListView({super.key});
  const FeaturedBoxListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
         
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 
               state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                
               
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: CustomLisViewImage(
                      imageUrl:
                          // net[index]
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              'https://th.bing.com/th/id/OIP.GZfrgP79dmsyndsOpAh-SgHaFj?pid=ImgDet&rs=1',
                             
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else if (state is FeaturedBooksLoading) {
          
          return const Center(child: CustomLoadingIndecator());
        } else {
          return const Text('Error');
        }
      },
    );
  }
}
