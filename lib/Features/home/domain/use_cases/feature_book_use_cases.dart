import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repo/home_repo.dart';

class FeatureBookUseCases {
  final HomeRepo homeRepo;
  FeatureBookUseCases( this.homeRepo);
  Future<List<BookEntity>> call() async{
    var response= homeRepo.fetchFeaturedBook();
    return response;
    

  }
}