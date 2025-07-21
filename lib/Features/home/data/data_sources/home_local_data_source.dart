import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

 abstract class HomeLocalDataSource {
List<BookEntity> fetchFeaturedBook();
 List<BookEntity> fetchNewestBook();

 }
 class HomeLocaDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBook() {
   var box= Hive.box<BookEntity>(kFeaturedBooks);
return box.values.toList();
  }
 
  @override
  List<BookEntity> fetchNewestBook() {
var box=Hive.box<BookEntity>(kNewestBooks);
return box.values.toList();
  }

 }
