import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_retrofit/bloc/base_bloc.dart';
import 'package:flutter_bloc_retrofit/bloc/singleton_storage.dart';
import 'package:flutter_bloc_retrofit/helpers/shared_preferences.dart';
import 'package:flutter_bloc_retrofit/model/user_model.dart';
import 'package:flutter_bloc_retrofit/widget/loading_view.dart';

import '../main.dart';

abstract class GeneralScreen<T extends StatefulWidget> extends State<T> {

  LoadingView? loadingView;

  bool isLogin = false;

  AppLifecycleState? appLifecycleState;

  BaseBloc? initBloc();

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    setupBase();
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  void dispose() {
    disposeAll();
    super.dispose();
  }

  void disposeAll() {
    dismissLoading();

  }


  Future setupBase() async {
    initBloc();
    initDB();

    loadingView = LoadingView();
  }

  void showErrorRequest(String error) {
    print('BaseScreen errorNetwork:  $error');

  }

  initDB() async {

    await SingletonStorage.getInstance();
  }

  void showLoading(bool show) {
    loadingView ??= LoadingView();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (show) {
        loadingView!.show(context);
      } else {
        loadingView!.hide();
      }
    });
  }
  Widget loadingCenter() {
    return Container(
      color: Colors.white.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(
          // valueColor: AlwaysStoppedAnimation<Color>(AppColor.red),
        ),
      ),
    );
  }
  void dismissLoading() {
    if (loadingView != null) {
      loadingView!.hide();
    }
  }
  saveUser(UserModel userModel)async{
    SharedPre.saveString(SharedPre.sharedPreID, userModel.id!);
    SharedPre.saveString(SharedPre.sharedPreName, userModel.name!);
    SharedPre.saveString(SharedPre.sharedPreEmail, userModel.email!);

  }

  backToScreen() {
    Navigator.of(context).pop();
  }

}
