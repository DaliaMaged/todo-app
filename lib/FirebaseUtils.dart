import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/Task.dart';

class FirebaseUtils{
  static CollectionReference<Task> getCollections(){
    return FirebaseFirestore.instance.collection(Task.collectionName)
        .withConverter<Task>(fromFirestore: (map,options) => Task.fromFireStore(map.data()!),
        toFirestore: (snapshot,options) => snapshot.toFireStore());
  }
  static Future<void> addTask(Task task) async{
    
    return await getCollections().doc(Task.collectionName).set(task);
  }
}