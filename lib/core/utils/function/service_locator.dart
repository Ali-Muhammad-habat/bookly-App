import 'package:bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo_imple.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupLocator(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(HomeRemoteDataSourceImpl( apiService: getIt<ApiService>()));
  getIt.registerSingleton<HomeRepoImple>(HomeRepoImple(homeLocalDataSource:HomeLocaDataSourceImpl() , 
  homeRemoteDataSource: getIt<HomeRemoteDataSourceImpl>()));
}
