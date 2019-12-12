import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass{
  /// ------------------------------------------------------------
  /// Method that returns the content for the lists name
  /// ------------------------------------------------------------
  static Future<String> getList(String listName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(listName) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the shopping list by name and content
  /// ----------------------------------------------------------
  static Future<bool> setList(String listName, String content) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(listName, content);
  }

  static Future<Set> getListSet() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }

  static Future <bool> removeList(String listName) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(listName);
  }

}