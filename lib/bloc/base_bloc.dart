
import 'package:dio/dio.dart';
import 'package:flutter_bloc_retrofit/bloc/singleton_storage.dart';
import 'package:flutter_bloc_retrofit/general/general_screen.dart';
import 'package:flutter_bloc_retrofit/helpers/shared_preferences.dart';
import 'package:flutter_bloc_retrofit/network/api_provider.dart';
import 'package:flutter_bloc_retrofit/network/handler/dio_exceptions.dart';

abstract class BaseBloc {
  final String baseUrl = "https://yodobashi.hls-dev.asia/api/";

  late ApiProvider restApi ;
   String token='';
  BaseBloc() {
    var dio = Dio();

    SharedPre.getToken().then((value){
      if(value!=null){
        token =value;
        restApi =ApiProvider(dio,token, baseUrl: baseUrl);
      }

    });
    restApi =ApiProvider(dio,token, baseUrl: baseUrl);
  }
  GeneralScreen  baseScreen();
  void dispose() {}

  void handleError(DioError dioError){
    String error =DioExceptions.fromDioError(dioError).toString();
    if(baseScreen!=null){
      baseScreen().showErrorRequest(error);
    }else{
      print('baseScreen null');
    }
  }

  void showLoading(bool show){
    if(baseScreen!=null){
      baseScreen().showLoading(show);
    }else{
      print('baseScreen: null');
    }
  }
}
