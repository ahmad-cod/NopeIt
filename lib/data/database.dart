import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todoList = [];

  // reference our box
  final _myBox = Hive.box('myBox');

  // methods: initial data loading, load data, update todoList
  void createInitialData () {
    todoList = [
      ["Eating after 10pm", false],
    ];
  }

  void loadData () {
    todoList = _myBox.get('TODOLIST');
  }

  // update db with changes
  void updateDatabase () {
    _myBox.put('TODOLIST', todoList);
  }
}