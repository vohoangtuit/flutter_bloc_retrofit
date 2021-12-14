import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc_retrofit/bloc/base_bloc.dart';
import 'package:flutter_bloc_retrofit/general/general_screen.dart';
import 'package:flutter_bloc_retrofit/helpers/shared_preferences.dart';
import 'package:flutter_bloc_retrofit/model/request/login_request.dart';
import 'package:flutter_bloc_retrofit/model/user_model.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BaseBloc{
  GeneralScreen screen;
  UserBloc(this.screen);
  @override
  GeneralScreen<StatefulWidget> baseScreen() {
    return screen;
  }

  final getInfo = PublishSubject<UserModel>();
  Stream<UserModel> get getInfoStream => getInfo.stream;

  @override
  void dispose() {
    super.dispose();
    getInfo.close();

  }
  Future<UserModel> loginUser(LoginRequestModel loginModel) async {
    UserModel result=UserModel();
    showLoading(true);
    try {
      await restApi.loginAccountMemember(loginModel).then((value) {
        showLoading(false);
        if(value.payload.toString().isNotEmpty){

          if(value.payload['token']!=null){
            SharedPre.saveString(SharedPre.sharedPreToken, value.payload['token']);
          }
          if(value.payload['user']!=null){
            result = UserModel.fromJson(value.payload['user']);
          }

        }
      });
    } on DioError catch (dioError) {
      showLoading(false);
      handleError(dioError);

      return result;
    }
    showLoading(false);
    return result;
  }

  Future<void> getUser() async {
    UserModel user=UserModel();
    try {
      await restApi.getUser().then((value) {
        showLoading(false);
        if(value!=null){
          user = UserModel.fromJson(value);
        }
      });
    } on DioError catch (dioError) {

      handleError(dioError);

    }
    getInfo.sink.add(user);
  }
}