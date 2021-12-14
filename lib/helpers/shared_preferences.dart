import 'package:shared_preferences/shared_preferences.dart';
class SharedPre {
  static String sharedPreAccount ="account";
  static String sharedPreName ="name";
  static String sharedPreEmail ="email";

  static String sharedPreID ="id";
  static String sharedPreToken ="token";

  static Future<bool> saveBool(String key,bool value) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(key, value);
  }
  static Future<bool> saveString(String key,String value) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(key, value);
  }
  static Future<bool> saveInt(String key,int value) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(key, value);
  }

  static Future<bool?> getBoolKey(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.getBool(key);
  }

  static Future<String?> getStringKey(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return  sharedPreferences.getString(key);
  }
  static Future<String?> getToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return  sharedPreferences.getString(sharedPreToken);
  }

  static Future<int?> getIntKey(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.getInt(key);
  }

  static Future<bool> clearKey(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.remove(key);
  }

  static Future<void> clearData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }


}