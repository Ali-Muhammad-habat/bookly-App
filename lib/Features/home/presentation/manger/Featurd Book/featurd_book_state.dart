

import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';

abstract class FeaturedBookState  {
}

class FeaturedBookInitial extends FeaturedBookState {}
class FeaturedBookLoading extends FeaturedBookState {}
class FeaturedBookSuccess extends FeaturedBookState {
  List<BookEntity> featuredBook=[];
}
class FeaturedBookFailue extends FeaturedBookState {
  final String errorMessage;
 FeaturedBookFailue(this.errorMessage);
}
