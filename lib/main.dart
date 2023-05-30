import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvc_unit_test/dependencies.dart';
import 'package:riverpod_mvc_unit_test/screens/todo_view/todo_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.inject();
    return const MaterialApp(
      home: ProviderScope(
        child: TodoView(),
      ),
    );
  }
}
