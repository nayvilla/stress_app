import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_event.freezed.dart';

@freezed
class SingupEvent with _$SingupEvent {
  const factory SingupEvent.todoUsernameChanged({required String text}) = TodoUsernameChanged;
  const factory SingupEvent.todoFullnameChanged({required String text}) = TodoFullnameChanged;
  const factory SingupEvent.todoAgeChanged({required String text}) = TodoAgeChanged;
  const factory SingupEvent.todoCountryChanged({required String text}) = TodoCountryChanged;
  const factory SingupEvent.todoProvinceChanged({required String text}) = TodoProvinceChanged;
  const factory SingupEvent.todoCityChanged({required String text}) = TodoCityChanged;
  const factory SingupEvent.todoEmailChanged({required String text}) = TodoEmailChanged;
  const factory SingupEvent.todoPasswordChanged({required String text}) = TodoPasswordChanged;
  //const factory SingupEvent.todoStatusChanged({required String todoId}) = TodoStatusChanged;  
  const factory SingupEvent.addTodo() = AddTodo;
}

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginUsernameChanged({required String text}) = LoginUsernameChanged;
  const factory LoginEvent.loginPasswordlChanged({required String text}) = LoginPasswordlChanged;
  const factory LoginEvent.addTodoLogin() = AddTodo_login;
}