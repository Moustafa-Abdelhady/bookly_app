import 'package:book_store/features/search/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key,});

  // final BookModel bookModel;

  // @override
  @override
  Widget build(BuildContext context) {
  
    
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(
        
        ),
      ),
    );
  }
}
