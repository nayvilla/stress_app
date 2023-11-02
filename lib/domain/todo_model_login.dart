import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/Interfaces/pages/constants/constants.dart';

part 'todo_model_login.freezed.dart';

@freezed
class TodoModelLogin with _$TodoModelLogin {
  const factory TodoModelLogin({
    // ignore: non_constant_identifier_names
    //required String id_usuario,
    required String usernameLogin,
    required String passwordLogin,  
    required bool isTodoCompleted,
    
  }) = _TodoModelLogin;

  const TodoModelLogin._();

  factory TodoModelLogin.empty() => const TodoModelLogin(
        //id_estado_cuenta: "",
        usernameLogin: Constants.username,
        passwordLogin: Constants.password,
        isTodoCompleted: false,
      );
}