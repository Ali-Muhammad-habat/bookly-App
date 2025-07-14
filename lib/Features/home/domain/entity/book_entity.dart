import 'package:hive/hive.dart';
part 'book_entity.g.dart';
@HiveType(typeId: 0)
class BookEntity {
  @HiveField(1)
  final String  bookId;
@HiveField(2)
  final String? image;
@HiveField(3)
  final String title;
@HiveField(4)
  final num ? price;
@HiveField(5)
  final String ?aotherName;
@HiveField(6)
  final num ?rating ;

  BookEntity({required this.bookId,
   required this.image, required this.title,
    required this.price,
     required this.aotherName,
      required this.rating}); 
}
