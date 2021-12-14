import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc_retrofit/bloc/base_bloc.dart';
import 'package:flutter_bloc_retrofit/general/general_screen.dart';

class HomeBloc extends BaseBloc{
  GeneralScreen screen;
  HomeBloc(this.screen);
  @override
  GeneralScreen<StatefulWidget> baseScreen() {
    return screen;
  }
  // todo
}