import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepreftask/models/user_model.dart';
import 'dart:convert';
class Prefs{

  //User related
  static storeUser(User user) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    pref.setString("user", stringUser);
  }

  static Future <User?> loadUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString("user");
    if(stringUser == null){
      return null;
    }
    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future <bool> removeUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove("user");
  }


  //Account related
  static storeAccount(Account account) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stringAccount = jsonEncode(account);
    pref.setString("account", stringAccount);
  }

  static Future <Account?> loadAccount() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? stringAccount = pref.getString("account");
    if(stringAccount == null){
      return null;
    }
    Map<String, dynamic> map = jsonDecode(stringAccount);
    return Account.fromJson(map);
  }

  static Future <bool> removeAccount() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove("account");
  }

}