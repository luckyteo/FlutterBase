import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  //private constructor
  PrefHelper._();

  // ignore: missing_return
  static setString(
      {required String key, required String data}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

///////////////////////////////////////////////////////////////////////////////////////
  // ignore: missing_return
  static setTokenApp(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token_app', token);
  }

  static Future<String> getTokenApp() async {
    final prefs = await SharedPreferences.getInstance();
    // Try reading data from the counter key. If it doesn't exist, return 0.
    return prefs.getString('token_app') ?? '';
  }

  static setDataPayload(String payload)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("notify_payload", payload);
  }

  static Future<String> getDataPayload() async {
    final prefs = await SharedPreferences.getInstance();
    // Try reading data from the counter key. If it doesn't exist, return 0.
    return prefs.getString('notify_payload') ?? '';
  }


  // ignore: missing_return
  static clearLogout() async {
    final prefs = await SharedPreferences.getInstance();
    //-----------------------
    prefs.remove('token_app');
  }
}
