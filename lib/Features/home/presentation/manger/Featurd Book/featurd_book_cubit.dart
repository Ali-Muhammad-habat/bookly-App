
import 'package:bookly_app/Features/home/domain/use_cases/feature_book_use_cases.dart';
import 'package:bookly_app/Features/home/presentation/manger/Featurd%20Book/featurd_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturdBookCubit extends Cubit<FeaturedBookState> {
  FeaturdBookCubit(this.featureBookUseCases) : super(FeaturedBookInitial());
   final FeatureBookUseCases featureBookUseCases;
   Future<void> featchFeatureBook() async{
    var result= await featureBookUseCases.call();
    result.fold((failure){
      emit(FeaturedBookFailue(failure.message));
    }, (book){
      emit(FeaturedBookSuccess(featuredBook:book ));
    });

   }
}
