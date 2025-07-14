import 'package:bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repo/home_repo.dart';
import 'package:bookly_app/core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple  extends HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImple({
required this.homeRemoteDataSource,
required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook() async {
    try {
  var  listBooks=homeLocalDataSource.fetchFeaturedBook();
  if (listBooks.isNotEmpty){
    return right(listBooks);
  }
  var books= await  homeRemoteDataSource.fetchFeaturedBook();
  return right(books);
}  catch (e) {
  if(e is DioException){
    return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(e.toString()));

}


  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook() async  {
   try {
  var  listBooks=homeLocalDataSource.fetchNewestBook();
  if (listBooks.isNotEmpty){
    return right(listBooks);
  }
  var books= await  homeRemoteDataSource.fetchNewestBook();
  return right(books);
}   catch (e) {
  if(e is DioException){
    return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(e.toString()));

}

  }
}