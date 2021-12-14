import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_retrofit/helpers/shared_preferences.dart';
import 'package:flutter_bloc_retrofit/model/request/login_request.dart';
import 'package:flutter_bloc_retrofit/model/user_model.dart';
import 'package:retrofit/retrofit.dart';

import 'base/response_model.dart';
part 'api_provider.g.dart';

@RestApi(baseUrl: '')
abstract class ApiProvider {

  factory ApiProvider(Dio dio,String token, {String? baseUrl}) {

    Map<String, dynamic> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Language': 'vi'
    };
    dio.options = BaseOptions(
      // receiveTimeout: 7000,
      // connectTimeout: 7000,
      // contentType: 'application/json',
      headers: requestHeaders,

    );
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
    }
    return _ApiProvider(dio, baseUrl: baseUrl);
  }


  @POST('user')
  @FormUrlEncoded()
  Future<ResponseModel> loginAccountMemember(@Body()LoginRequestModel loginModel) ;

  @GET('user/me')
  Future<dynamic> getUser() ;

}

