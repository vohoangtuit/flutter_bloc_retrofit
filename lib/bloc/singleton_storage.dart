import 'package:shared_preferences/shared_preferences.dart';

class SingletonStorage {
  static SingletonStorage? _instance;
  static SharedPreferences? _preferences;
  static String TAG_TEMPLATE ='template_app';
  static String TAG_EMAIL ='email';
  static String TAG_NAME ='name';
  static String TAG_TOKEN ='token';
  static String TAG_ID ='id';


  static Future<SingletonStorage?> getInstance() async {
    _instance ??= SingletonStorage();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  static void saveUser(String userJson) {
    _preferences!.setString('user_model', userJson);
  }

  static Future<String?> getUser() async {
    // Retrieve value later
    return _preferences!.getString('user_model');
  }

  static void setString(String key,String value) {
    _preferences!.setString(key, value);
  }
  static Future<String?> getString(String key) async {
    return _preferences!.getString(key);
  }
  static void setToken(String token) {
    _preferences!.setString('token', token);
  }
  static String getToken()  {
    return _preferences!.getString('token').toString();
  }

  static Future<bool> clearData()async{
   return await _preferences!.clear();
  }
}