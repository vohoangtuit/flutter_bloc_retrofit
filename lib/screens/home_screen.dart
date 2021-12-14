import 'package:flutter/material.dart';
import 'package:flutter_bloc_retrofit/bloc/base_bloc.dart';
import 'package:flutter_bloc_retrofit/bloc/home_bloc.dart';
import 'package:flutter_bloc_retrofit/bloc/singleton_storage.dart';
import 'package:flutter_bloc_retrofit/bloc/user_bloc.dart';
import 'package:flutter_bloc_retrofit/general/general_screen.dart';
import 'package:flutter_bloc_retrofit/helpers/shared_preferences.dart';
import 'package:flutter_bloc_retrofit/model/user_model.dart';
import 'package:flutter_bloc_retrofit/screens/login_screen.dart';
import 'package:flutter_bloc_retrofit/widget/loading_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends GeneralScreen<HomeScreen> {
  UserBloc? userBloc;
  String? _name='';
  String? _email='';
  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Center(child: Container(
        child: _viewInfo(),
      )),
    );
  }

  @override
  BaseBloc? initBloc() {

    return userBloc =UserBloc(this);
  }
  @override
  void initState() {

    super.initState();

    _getData();

  }

  _getData()async{
    Future.delayed(const Duration(milliseconds: 1500), () {
      userBloc!.getUser();
    });

   // await SharedPre.getStringKey(SharedPre.sharedPreName).then((value){
   //    setState(() {
   //      _name =value;
   //    });
   //  });
   // await SharedPre.getStringKey(SharedPre.sharedPreEmail).then((value){
   //   setState(() {
   //     _email =value;
   //   });
   // });
  }
  Widget _viewInfo(){
    return StreamBuilder(
      stream: userBloc!.getInfoStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          userModel = snapshot.data as UserModel?;
          if (userModel!.id!=null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${userModel!.name!}'),
                SizedBox(height: 20,),
                Text('Email:${userModel!.email!}'),
                SizedBox(height: 20,),
                InkWell(child: Container(
                  padding: EdgeInsets.only(left: 15,top: 10,right: 15,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue)),
                  child: Text('Logout',style: TextStyle(color: Colors.white,fontSize: 16),),
                ),onTap: (){
                  _logout();
                },)
              ],
            );
          } else {
            return Container();
          }
        } else {
          return loadingCenter();
        }
      },
    );

  }

  _logout()async{
    await SharedPre.clearData();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => LoginScreen(
            )),
            (Route<dynamic> route) => false);
  }
}
