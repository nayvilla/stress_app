import 'package:app/Interfaces/pages/widgets/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/domain/todo_model_singup.dart';
//import 'package:app/Interfaces/pages/widgets/login.dart';
import 'package:app/provider/provider_singup.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoNotifierProvider.select((state) => state.todoList));
    final reversedTodoList = List<TodoModelSing>.from(todoList.reversed);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //TodosActionPart(),
              RegisterPart(todoList: reversedTodoList),
            ],
          ),
        ),
      ),
    );
  }
}