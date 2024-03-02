import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppConfigNotifier.dart';
import 'package:todo_app/FirebaseUtils.dart';
import 'package:todo_app/TodoTheme.dart';

import '../Task.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  var selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  var title = "";
  var description = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigNotifier>(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "${AppLocalizations.of(context)?.add_new_task}",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (text) {
                        title = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return "${AppLocalizations.of(context)?.enter_your_task_error}";
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)?.enter_your_task,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: TodoTheme.textGrey)),
                    ),
                    TextFormField(
                      onChanged: (text) {
                        description = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return "${AppLocalizations.of(context)?.add_task_decription_error}";
                        else
                          return null;
                      },
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)?.add_task_decription,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: TodoTheme.textGrey)),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "${AppLocalizations.of(context)?.select_time}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: showCalender,
              child: Text(
                "${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: TodoTheme.textGrey,
                    ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  addTask();
                },
                child: Text(
                  "${AppLocalizations.of(context)?.add_new_task}",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }

  showCalender() async {
    var changeSelectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    selectedDate = changeSelectedDate ?? DateTime.now();
    setState(() {});
  }

  addTask() {
    if (_formKey.currentState!.validate()==true) {
      FirebaseUtils.addTask(Task(
              title: title, description: description, dateTime: selectedDate))
          .timeout(Duration(microseconds: 500), onTimeout: () {
        print("success add task");
      })
      .onError((error, stackTrace) => (){
        print('$stackTrace');
      })
      ;
    }
  }
}
