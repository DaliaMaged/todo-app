import 'package:flutter/material.dart';

class AppConfigNotifier extends ChangeNotifier {
var language = "en";
var theme = "light";
void changeLangugae({required String newLanguage}){
  language = newLanguage;
}
void changeTheme({required String newTheme}){
  theme = newTheme;
}
}