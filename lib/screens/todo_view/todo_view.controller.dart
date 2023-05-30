import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:riverpod_mvc_unit_test/models/todo.dart';

class TodoController extends ChangeNotifier {
  final List<Todo> _todos = [];
  int _count = 0;
  int get count => _count;
  List<Todo> get todo => _todos;

  void increment() {
    _count++;

    notifyListeners();
  }

  void addTodo({required String title}) {
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  void toggleIsCompleted(int index) {
    _todos[index].isCompleted = !_todos[index].isCompleted;
    notifyListeners();
  }
}
