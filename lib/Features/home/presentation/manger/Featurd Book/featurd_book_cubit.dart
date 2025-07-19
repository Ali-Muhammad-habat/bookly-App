
import 'package:bookly_app/Features/home/presentation/manger/Featurd%20Book/featurd_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturdBookCubit extends Cubit<FeaturedBookState> {
  FeaturdBookCubit() : super(FeaturedBookInitial());
}
