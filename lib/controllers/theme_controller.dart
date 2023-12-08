import 'package:flutter/material.dart';
import 'package:ko_ok/core/values/styles/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController with ChangeNotifier {
late MyTheme theme ;

  Future<void> saveTheme(String theme) async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('THEME', theme);
  }

  Future<void> loadTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String action = prefs.getString('THEME')??'sif';

    switch (action) {
      case "sif": theme = MyTheme(Button: "soleil.png",appBarImage: "sif.png",backgroundImage: "BGSIF.png");break;
      case "5rif": theme = MyTheme(Button: "sans-heuilles.png",appBarImage: "5rif.png",backgroundImage: "BG5rif.png");break;
      case "chte": theme = MyTheme(Button: "flocon-de-neige.png",appBarImage: "chte.png",backgroundImage: "BGchte.png");break;
      case "rbi3": theme = MyTheme(Button: "tulipe.png",appBarImage: "rbi3.png",backgroundImage: "BGspring.png");break;
      default: theme = MyTheme(Button: "soleil.png",appBarImage: "sif.png",backgroundImage: "BGSIF.png");break;
    }


  } 
 
 void setTheme(String newTheme){
   switch (newTheme) {
    case "sif": theme = MyTheme(Button: "soleil.png",appBarImage: "sif.png",backgroundImage: "BGSIF.png");break;
      case "5rif": theme = MyTheme(Button: "sans-heuilles.png",appBarImage: "5rif.png",backgroundImage: "BG5rif.png");break;
      case "chte": theme = MyTheme(Button: "flocon-de-neige.png",appBarImage: "chte.png",backgroundImage: "BGchte.png");break;
      case "rbi3": theme = MyTheme(Button: "tulipe.png",appBarImage: "rbi3.png",backgroundImage: "BGspring.png");break;
      default: theme = MyTheme(Button: "soleil.png",appBarImage: "sif.png",backgroundImage: "BGSIF.png");break;
    }
    notifyListeners();
 }
}
