import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvc_unit_test/dependencies.dart';
import 'package:riverpod_mvc_unit_test/screens/todo_view/todo_view.controller.dart';

class TodoView extends ConsumerStatefulWidget {
  const TodoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoViewState();
}

class _TodoViewState extends ConsumerState<TodoView> {
  TextEditingController titlteController = TextEditingController();
  late TodoController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = ref.watch(todoProviderController);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Application'),
      ),
      body: Column(children: [
        Flexible(
          child: ListView.builder(
            itemCount: controller.todo.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                value: controller.todo[index].isCompleted,
                onChanged: (_) {
                  controller.toggleIsCompleted(index);
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(controller.todo[index].title.toString()),
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextFormField(
              controller: titlteController,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      child: const Text("Add New Todo"),
                      onPressed: () {
                        controller.addTodo(title: titlteController.text.trim());
                      },
                    ),
                  ),
                ),
              ],
            )
          ]),
        )
      ]),
    );
  }
}
