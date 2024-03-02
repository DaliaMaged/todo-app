
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppConfigNotifier.dart';
import 'package:todo_app/TodoTheme.dart';
import 'package:todo_app/homeScreen/TodoListHomeScreen.dart';
import 'package:todo_app/homeScreen/home_screen.dart';
import 'package:todo_app/settings/SettingsScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(create:(context) => AppConfigNotifier() ,
  child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:TodoTheme.todo_light ,
    //  darkTheme: TodoTheme.todo_dark,
      initialRoute: HomeScreen.homeScreen,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.homeScreen : (context)=> HomeScreen(),
        TodoListHomeScreen.todoListScreen: (context)=> TodoListHomeScreen(),
        SettingsScreen.settingsScreen : (context)=> SettingsScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
