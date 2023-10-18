
import 'package:book_store/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model/book_model.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSearchBooks( String query) async {
  
    emit(SearchBooksLoading());
 

    var result = await homeRepo.fetchSearchBooks( query: query);
    
    result.fold((failure) {
      emit(SearchBooksFailure(failure.errMessage));
    }, (books) {
       List<BookModel> filteredBooks = books
        .where((books) => books.volumeInfo.title!.contains(query))
        .toList();
      
      emit(SearchBooksSuccess(filteredBooks));
    });
  } 
}
