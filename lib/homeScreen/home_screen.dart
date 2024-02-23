import 'package:flutter/material.dart';
import 'package:todo_app/TodoTheme.dart';
import 'package:todo_app/homeScreen/TodoListHomeScreen.dart';
import 'package:todo_app/settings/SettingsScreen.dart';

class HomeScreen extends StatefulWidget {
  static String homeScreen = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text("To Do List"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: TodoTheme.customWhite,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
      BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child:
        BottomNavigationBar(

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
            // TodoListHomeScreen(),
            // SettingsScreen()
          ],
          currentIndex: selectedIndex,
          onTap: (int) {
            selectedIndex = int;
            setState(() {});
          },
        ),
      ),
      body: selectedIndex == 0 ? TodoListHomeScreen() : SettingsScreen(),
    );
  }
}
