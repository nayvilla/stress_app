import 'package:app/application_state/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/domain/todo_model_singup.dart';
import 'package:app/provider/provider_singup.dart';
import 'package:app/Interfaces/pages/widgets/custom/custom_text_field.dart';
import 'package:app/Interfaces/pages/widgets/custom/custom_date_input.dart';
import 'package:app/Interfaces/pages/constants/constants.dart';
//import 'package:app/Interfaces/pages/widgets/custom/custom_dropdown.dart';
//import 'package:app/Interfaces/pages/widgets/login.dart';

// ignore: must_be_immutable
class RegisterPart extends ConsumerWidget {
  //final TodoModelSing todoItem;
  final List<TodoModelSing> todoList;
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerFullname = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  //TextEditingController controllerAge = TextEditingController();
  TextEditingController controllerCountry = TextEditingController();
  TextEditingController controllerProvince = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  RegisterPart({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TextEditingController controllerUsername = TextEditingController();
    //final List<CharacterModel> characterList = ref.watch(searchProvider).characterList;
    String? fechaNacimiento = Constants.age;

    return Column(
            children: [
              const Text(
                "Registro",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Por favor regístrate para usar la app",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20), // Márgenes para dar espacio alrededor del contenido
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 2, // Ancho del borde
                  ),
                borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    customTextField(
                      'Usuario', 'Ingrese un nombre de usuario', 30, controller: controllerUsername,
                      onChanged: (text) {
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoUsernameChanged(text: controllerUsername.value.text),);
                      },
                    ),
                    customTextField(
                      'Nombre Completo', 'Ingrese su nombre completo', 120, controller: controllerFullname,
                      onChanged: (text) {
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoFullnameChanged(text: controllerFullname.value.text),);
                      },
                    ),
                    customTextField(
                      'Password', 'Ingrese una contraseña', 25, controller: controllerPassword,
                      onChanged: (text) {
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoPasswordChanged(text: controllerPassword.value.text),);
                      },
                    ),
                    customDateInput(
                      'Fecha de Nacimiento',
                      'Seleccione la fecha de nacimiento',
                      fechaNacimiento,
                      (String? value) {
                        fechaNacimiento = value;
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoAgeChanged(text: fechaNacimiento ?? ''),);
                      },
                    ),
                    customTextField(
                      'Email', 'Ingrese su email', 30, controller: controllerCity,
                      onChanged: (text) {
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoProvinceChanged(text: controllerCity.value.text),);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );

  }
}

// Future<bool> openMyForm(BuildContext context, List<TodoModelSing> todoList) async {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         content: Column(
//           children: [
//             TodosActionPart(
//               todoItem: todoList.isNotEmpty ? todoList[0] : TodoModelSing.empty(),
//             ),
//           ],
//         ),
//       );
//     },
//   );
//   return true;
// }


// ///Funcion para actualizar
// Future<void> openEditForm(BuildContext context, TodoModel todoItem) async {
//   await showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         content: Column(
//           children: [
//             TodosActionPart(todoItem: todoItem), // Pasa el objeto todoItem a la interfaz de edición
//           ],
//         ),
//       );
//     },
//   );
// }