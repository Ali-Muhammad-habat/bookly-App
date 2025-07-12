 import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';

abstract class HomeRepo {
  Future<<Ether>List<BookEntity>> fetchFeaturedBook();
  Future<List<BookEntity>> fetchNewestBook();
 }