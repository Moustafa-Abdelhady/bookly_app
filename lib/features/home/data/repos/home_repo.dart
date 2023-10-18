import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/book_model/book_model.dart';
/////homeRepo is an abstract class to content on
///my methods without implementation so i will recieve an Future<List<BookModel>>
///and we want to make methods win fails and when success so we must use
///an (Either) on package (dartz) to handle my errors easly instead of try and catch
///like that n

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();

  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});

  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
    {required String query}
  );
}
