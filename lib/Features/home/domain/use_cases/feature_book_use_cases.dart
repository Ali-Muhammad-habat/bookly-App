import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repo/home_repo.dart';
import 'package:bookly_app/core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class FeatureBookUseCases {
  final HomeRepo homeRepo;
  FeatureBookUseCases( this.homeRepo);
  Future<Either<Failure,List<BookEntity>>>call() async{
    var response= homeRepo.fetchFeaturedBook();
    return response;
  }
}