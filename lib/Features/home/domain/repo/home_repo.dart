 import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBook();
  Future<Either<Failure,List<BookEntity>>> fetchNewestBook();
 }
