import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class TodoListNotifier extends InheritedWidget{
  TodoListNotifier({super.key,required super.child});
  final List<Todo> todoList =[];
  static TodoListNotifier of (BuildContext context){
    final TodoListNotifier? list = context.dependOnInheritedWidgetOfExactType<TodoListNotifier>();
    return list!;
  }
  @override
  bool updateShouldNotify(TodoListNotifier oldWidget) {
    return todoList!=oldWidget.todoList;
  }
}
