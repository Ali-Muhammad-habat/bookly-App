import 'package:bookly_app/Features/home/data/model/book_model.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/function/save_data_box_hive.dart';
import 'package:hive/hive.dart';
abstract class HomeRemoteDataSource {
 Future<List<BookEntity>> fetchFeaturedBook();
 Future<List<BookEntity>> fetchNewestBook();}
 class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBook() async {
 
 var data=  await apiService.get(endPoint: "volumes?q=programming&Filtering=free-ebooks");
 List<BookEntity> books = getBooksList(data);
 SaveDataBooks(books, kFeaturedBooks);
 return books;

  }
  @override
  Future<List<BookEntity>> fetchNewestBook() async {
    var data= await apiService.get(endPoint: "volumes?q=programming&Filtering=free-ebooks&sorting=newest");
  List<BookEntity> books = getBooksList(data);
 return books;
  }

 

 }
   List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books=[];
    for(var  bookMap in data['items']){
     books.add(BookModel.fromJson(bookMap));
    }
    return books;
  
  }
  