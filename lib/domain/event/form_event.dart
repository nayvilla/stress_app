
import 'package:freezed_annotation/freezed_annotation.dart';
//import 'package:riverpod_app/domain/model/todo_model.dart'; 

part 'form_event.freezed.dart';

@freezed
class FormEvent with _$FormEvent {
  const factory FormEvent.formPregunta1Changed({required String text}) = FormPregunta1Changed;
  const factory FormEvent.formPregunta2Changed({required String text}) = FormPregunta2Changed;
  const factory FormEvent.formPregunta3Changed({required String text}) = FormPregunta3Changed;
  const factory FormEvent.formPregunta4Changed({required String text}) = FormPregunta4Changed;
  const factory FormEvent.formPregunta5Changed({required String text}) = FormPregunta5Changed;
  const factory FormEvent.formPregunta6Changed({required String text}) = FormPregunta6Changed;
  const factory FormEvent.formPregunta7Changed({required String text}) = FormPregunta7Changed;
  const factory FormEvent.formPregunta8Changed({required String text}) = FormPregunta8Changed;
  const factory FormEvent.addTodo() = AddTodo;
}