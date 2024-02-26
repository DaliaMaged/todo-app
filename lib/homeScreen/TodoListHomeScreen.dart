import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppConfigNotifier.dart';
import 'package:todo_app/TodoTheme.dart';

class TodoListHomeScreen extends StatefulWidget {
  static String todoListScreen = "todoListScreen";
  const TodoListHomeScreen({super.key});

  @override
  State<TodoListHomeScreen> createState() => _TodoListHomeScreenState();
}

class _TodoListHomeScreenState extends State<TodoListHomeScreen> {
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  var _focusDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigNotifier>(context);

    return Column(
children: [
  EasyInfiniteDateTimeLine(
    locale: provider.language=="en" ? "en" : "ar",
    controller: _controller,
    firstDate: DateTime(2024),
    focusDate: _focusDate,
    lastDate: DateTime(2024, 12, 31),
    onDateChange: (selectedDate) {
      setState(() {
        _focusDate = selectedDate;
      });
    },
    activeColor: TodoTheme.primaryLight,
     dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
            decoration: BoxDecoration(
              color: TodoTheme.customWhite,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              )
        ),
      todayHighlightStyle: TodayHighlightStyle.withBackground,
      activeDayNumStyle: TextStyle(
          color: TodoTheme.primaryLight,
          fontWeight: FontWeight.w600
      ),
      activeDayStrStyle: TextStyle(
          color: TodoTheme.primaryLight,
        fontWeight: FontWeight.w600
      ),
      inactiveDayStyle: DayStyle(
        decoration: BoxDecoration(
          color: TodoTheme.customWhite,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        dayStrStyle: TextStyle(
            color: TodoTheme.customBlack,
            fontWeight: FontWeight.w600
        ),
        dayNumStyle: TextStyle(
            color: TodoTheme.customBlack,
            fontWeight: FontWeight.w600
        )
      )
    ),
  ),

],
    );
  }
}
