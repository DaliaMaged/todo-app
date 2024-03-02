class Task {
  static String collectionName = "tasks";
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isdone;

  Task(
      {required this.title,
      required this.description,
      required this.dateTime,
      this.isdone = false,
      this.id = ''});

   Map<String, dynamic> toFireStore() {
    return {
      "title": title,
      "description": description,
      "dateTime": dateTime.microsecondsSinceEpoch,
      "isdone": isdone,
      "id": id
    };
  }

   Task.fromFireStore(Map<String, dynamic> task):this(
       title: task['title'],
       description: task['description'],
       dateTime: DateTime.fromMicrosecondsSinceEpoch(task['dateTime']),
       isdone: task['isdone'],
       id: task['id']
   );

}
