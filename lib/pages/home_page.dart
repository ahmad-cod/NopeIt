// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/models/not_todo.dart';
import 'package:todo_app/services/firestore.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();

  // hive box
  // final _myBox = Hive.box('myBox');
  // text controller
  final _controller = TextEditingController();

  // ToDoDatabase db = ToDoDatabase();

  // @override
  // void initState() {
  //   // for the first time ever opening the app, create a default data
  //   if(_myBox.get('TODOLIST') == null) {
  //     db.createInitialData();
  //   } else {
  //     db.loadData();
  //   }

  //   // TODO: implement initState
  //   super.initState();
  // }

  void checkBoxChanged(bool? value, String id) {
    firestoreService.updateNotTodo(id, value!);
    // setState(() {
    //   db.todoList[index][1] = value!;
    // });
    // db.updateDatabase();
  }

  // Add task to the db.todolist
  void saveNewTask() {
    NotTodo newNotTodo = NotTodo(title: _controller.text, isCompleted: false);
    firestoreService.addNotTodo(newNotTodo);
    _controller.clear();
    Navigator.pop(context);
    // setState(() {
    //   db.todoList.add([_controller.text, false]);
    //   _controller.clear();
    // });
    // Navigator.of(context).pop();
    // db.updateDatabase();
  }

  void createNewTask () {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
  }

  void deleteTask (id) {
    firestoreService.deleteNotTodo(id);
    // setState(() {
    // db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text(
          'NOT TO DO!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[400],
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotTodoList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notTodosList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notTodosList.length,
            itemBuilder: (context, index) {
              DocumentSnapshot notTodo = notTodosList[index];
              String notTodoID = notTodo.id;
              Map<String, dynamic> data = 
                notTodo.data() as Map<String, dynamic>;
              

              return TodoTile(
                taskName: data['title'],
                isCompleted: data['isCompleted'],
                onChanged: (value) => checkBoxChanged(value, notTodoID),
                deleteTask: (context) => deleteTask(notTodoID),
              );
            },
          );
        } else {
          return Center(
            // child: TextButton(onPressed: () {}, child: const Text('Not todo list is empty, Add one!')),
            child: Text('Not todo list is empty, Add one!'),
          );
        }
        }
      ),
    
    );
  }
}