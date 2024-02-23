import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class TodoListHomeScreen extends StatefulWidget {
  static String todoListScreen = "todoListScreen";
  const TodoListHomeScreen({super.key});

  @override
  State<TodoListHomeScreen> createState() => _TodoListHomeScreenState();
}

class _TodoListHomeScreenState extends State<TodoListHomeScreen> {
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  @override
  Widget build(BuildContext context) {
    return Column(
children: [
  EasyInfiniteDateTimeLine(
    controller: _controller,
    firstDate: DateTime(2024),
    focusDate: DateTime.now(),
    lastDate: DateTime(2024, 12, 31),
    onDateChange: (selectedDate) {
      setState(() {
        //_focusDate = selectedDate;
      });
    },
  ),
],
    );
  }
}
