import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';

 abstract class HomeLocalDataSource {
List<BookEntity> fetchFeaturedBook();
 List<BookEntity> fetchNewestBook();

 }
