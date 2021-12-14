import 'package:flutter/material.dart';
import 'package:flutter_bloc_retrofit/helpers/shared_preferences.dart';
import 'package:flutter_bloc_retrofit/screens/home_screen.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: (Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),
            Text('Welcome',textAlign: TextAlign.center,)
          ],
        ),
      )),
    );
  }
  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  checkLogin()async{

     await SharedPre.getStringKey(SharedPre.sharedPreID).then((value) {
       Future.delayed(Duration(seconds: 3),()async{
         if(value!=null){
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

         }else{
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
         }
       }
       );
     });


  }
}