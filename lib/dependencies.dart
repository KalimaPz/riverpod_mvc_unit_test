import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvc_unit_test/screens/todo_view/todo_view.controller.dart';

late ProviderListenable<TodoController> todoProviderController;

class Dependencies {
  Dependencies.inject() {
    todoProviderController = ChangeNotifierProvider((ref) => TodoController());
  }
}
