
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
class FormModel with _$FormModel {
  const factory FormModel({
    required String pregunta1,
    required String pregunta2,
    required String pregunta3,
    required String pregunta4, 
    required String pregunta5,
    required String pregunta6,
    required String pregunta7,
    required String pregunta8,
    required String resultado,
  }) = _FormModel;

  const FormModel._();

  factory FormModel.empty() => const FormModel(
        pregunta1: "0",
        pregunta2: "0",
        pregunta3: "0",
        pregunta4: "0",
        pregunta5: "0",
        pregunta6: "0",
        pregunta7: "0",
        pregunta8: "0",
        resultado: "",
      ); 
}