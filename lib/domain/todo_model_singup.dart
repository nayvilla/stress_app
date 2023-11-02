//import 'dart:js_interop';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/Interfaces/pages/constants/constants.dart';

part 'todo_model_singup.freezed.dart';

@freezed
class TodoModelSing with _$TodoModelSing {
  const factory TodoModelSing({
    // ignore: non_constant_identifier_names
    required String id_usuario,
    required String username,
    required String fullname,
    required String password,
    required String country,
    required String province,
    required String city,
    required String email,
    required String age,   
    required String isTodoCompleted,
    
  }) = _TodoModelSing;

  const TodoModelSing._();

  factory TodoModelSing.empty() => TodoModelSing(
        id_usuario: "",
        username: Constants.username,
        fullname: Constants.fullname,
        password: Constants.password,
        country: Constants.country,
        province: Constants.province,
        city:Constants.city,
        email: Constants.email,
        age: Constants.age,
        isTodoCompleted: "false",
      );
}