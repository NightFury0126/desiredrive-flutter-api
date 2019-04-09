import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DesireQuerySave {

  Future<String> readLastSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.getString("savedQuery") ?? null;
  }

  Future<void> saveLastSearch(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("savedQuery", query);
  }

}