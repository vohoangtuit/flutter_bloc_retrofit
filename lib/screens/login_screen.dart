import 'package:flutter/material.dart';
import 'package:flutter_bloc_retrofit/bloc/base_bloc.dart';
import 'package:flutter_bloc_retrofit/bloc/singleton_storage.dart';
import 'package:flutter_bloc_retrofit/bloc/user_bloc.dart';
import 'package:flutter_bloc_retrofit/general/general_screen.dart';
import 'package:flutter_bloc_retrofit/helpers/shared_preferences.dart';
import 'package:flutter_bloc_retrofit/model/request/login_request.dart';
import 'package:flutter_bloc_retrofit/model/user_model.dart';
import 'package:flutter_bloc_retrofit/screens/home_screen.dart';
import 'package:flutter_bloc_retrofit/widget/custom_text_from_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends GeneralScreen<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  UserBloc? userBloc;
  String? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Center(child: _viewLogin()),);
  }

  @override
  BaseBloc? initBloc() {
   return userBloc =UserBloc(this);
  }
  @override
  void initState() {

    initDB();
    super.initState();


  }

  Widget _viewLogin(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column( mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text('Username'),
                usernameInput(usernameController),
                SizedBox(height: 20,),
                Text('Password'),
                passwordInput('',passwordController), SizedBox(height: 20,),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    _validate();
                  },
                  child: Container(
                   padding: EdgeInsets.only(top: 15,bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue)),
                    child: Center(child: Text('SignIn',style: TextStyle(color: Colors.white),)),
                  ),)
              ],
            ),

          ],
        ),
      ),
    );
  }
_validate()async{
  FocusScope.of(context).requestFocus(FocusNode());
  if (formKey.currentState!.validate()) {

    //final user = await bloc.postSignIn(usernameController.text, passwordController.text);
    LoginRequestModel loginModel = LoginRequestModel(account:usernameController.text, password:passwordController.text,role:'driver');
    _postLogin(loginModel);
  }
}
  _postLogin(LoginRequestModel loginModel)async{
    await userBloc!.loginUser(loginModel).then((value) {

      if(value.id!=null){
        UserModel userModel = value;
        saveUser(userModel);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                )),
                (Route<dynamic> route) => false);
      }

    });
  }


}
