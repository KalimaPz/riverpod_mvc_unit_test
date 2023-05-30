import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_mvc_unit_test/dependencies.dart';
import 'package:riverpod_mvc_unit_test/screens/todo_view/todo_view.controller.dart';

void main() async {
  late ProviderContainer container;
  late TodoController controller;
  setUp(() {
    Dependencies.inject();
    container = ProviderContainer();
    controller = container.read(todoProviderController);
  });

  group("Todo Controller : ", () {
    test("Create", () {
      controller.addTodo(title: "Mock Todo");
      // print("Todo Count : ${controller.todo.length}");
      expect(controller.todo.length, greaterThan(0));
    });

    test("Toggle", () {
      controller.addTodo(title: "Mock Todo");
      controller.toggleIsCompleted(0);
      // print("Todo Count : ${controller.todo.length}");
      expect(controller.todo[0].isCompleted, true);
    });

    test('Remove', () {
      // Test Case
    });
    test('Edit', () {
      // Test Case
    });
  });
}
