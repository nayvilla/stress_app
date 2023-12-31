
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/domain/model/todo_model.dart';

part 'form_state.freezed.dart';

@freezed
class FormState with _$FormState {
  factory FormState({
    required List<FormModel> formList, // Lista de tareas
    required FormModel form, // Tarea actual
  }) = _FormState; 

  const FormState._();

  factory FormState.empty() => FormState(
        formList: [], // Inicializa la lista de tareas como vacía
        form: FormModel.empty(), // Inicializa la tarea actual como vacía
      );
}

