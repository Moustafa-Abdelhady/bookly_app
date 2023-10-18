import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../generated/l10n.dart';
import '../../../home/data/models/book_model/book_model.dart';
import '../../../home/presentaion/manager/search_books_cubit/search_books_cubit.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _searchController = TextEditingController();

  String searchValue = '';

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      obscureText: false,
      onSubmitted: (value) {
        searchValue = value;
        setState(() {});

        searchValue == value
            ? BlocProvider.of<SearchBooksCubit>(context)
                .fetchSearchBooks(searchValue)
            : const Center(child: Text('Not Found'));
        // var title = widget.bookModel.volumeInfo.title;
        // print('title$title');
        // _searchController.clear();
      },
      decoration: InputDecoration(
          // fillColor: Colors.white,
          // filled: true,
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red)),
          hintText: S.of(context).searchBooks,
          suffixIcon: IconButton(
              onPressed: () {},
              icon:  Opacity(
                opacity: .8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                  color:Theme.of(context).primaryColor,
                ),
              ))),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide:
             BorderSide(color:Theme.of(context).primaryColor, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(16));
  }
}
