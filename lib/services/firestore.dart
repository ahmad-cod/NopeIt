import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/not_todo.dart';

class FirestoreService {
  // create and get the not todos collection instance
  final CollectionReference notTodos = FirebaseFirestore.instance.collection('notTodos');

  // add a new not to do
  Future<void> addNotTodo(NotTodo newNotTodo) {
    return notTodos.add({
      'title': newNotTodo.title,
      'isCompleted': newNotTodo.isCompleted,
      'timestamp': Timestamp.now()
    });
  }

  // get the not todos list
  Stream<QuerySnapshot> getNotTodoList() {
    return notTodos.orderBy('timestamp', descending: true).snapshots();
  }

  // update a not to do
  Future<void> updateNotTodo(String notTodoID, newData) {
    return notTodos.doc(notTodoID).update({
      // 'title': newData.title,
      'isCompleted': newData,
      'timestamp': Timestamp.now()
    });
  }

  // delete a not to do
  Future<void> deleteNotTodo(String notTodoID) {
    return notTodos.doc(notTodoID).delete();
  }
}