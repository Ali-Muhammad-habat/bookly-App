 import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:hive/hive.dart';

void SaveDataBooks(List<BookEntity> books , String boxName) {
    var box= Hive.box(boxName);
    box.addAll(books);
  }
