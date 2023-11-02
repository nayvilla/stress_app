import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/domain/todo_model_login.dart';
import 'package:app/domain/todo_model_singup.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState({
    required List<TodoModelSing> todoList, // Lista de tareas
    required TodoModelSing todo, // Tarea actual
  }) = _TodoState; 

  const TodoState._();

  factory TodoState.empty() => TodoState(
        todoList: [], // Inicializa la lista de tareas como vacía
        todo: TodoModelSing.empty(), // Inicializa la tarea actual como vacía
      );
}

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required List<TodoModelLogin> loginList,
    required TodoModelLogin todo, // Tarea actual
  }) = _LoginState;
  const LoginState._();

  factory LoginState.empty() => LoginState(
        loginList: [],
         todo: TodoModelLogin.empty(),
      );
}