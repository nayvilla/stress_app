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
  final List<TodoModelSing> todoList;
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerFullname = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerCountry = TextEditingController();
  TextEditingController controllerProvince = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  bool isChecked = true;

  RegisterPart({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? fechaNacimiento = Constants.age;

    return Container(
            //margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              // color: Colors.purple.shade100,
              // border: Border.all(
              //   color: Colors.black,
              //   width: 2,
              // ),
              borderRadius: BorderRadius.circular(20),
            ),
            child:Padding(
              padding: const EdgeInsets.only(top: 90),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),  // Ajusta el valor de padding según tus necesidades
                        child: SizedBox(
                          height: 100,
                          child: Text(
                            "Registrate",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 245, 242, 242),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customTextField(
                      'Nombres', 'Ingrese sus nombres', 120, controller: controllerFullname,
                      onChanged: (text) {
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoFullnameChanged(text: controllerFullname.value.text),);
                      },
                    ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customTextField(
                      'Apellidos', 'Ingrese sus apellidos', 120, controller: controllerCountry,
                      onChanged: (text) {
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoCountryChanged(text: controllerCountry.value.text),);
                      },
                    ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customTextField(
                          'Usuario', 'Ingrese un nombre de usuario', 30, controller: controllerUsername,
                          onChanged: (text) {
                            ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoUsernameChanged(text: controllerUsername.value.text),);
                          },
                          ),
                      ),
                    ),
                  ],
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15), // Ajusta el valor de padding según tus necesidades
                      child: IconButton(
                        icon: isChecked
                            ? const Icon(
                                Icons.check_box,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.grey,
                              ),
                        onPressed: () {
                          ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoCheckboxChanged(text: (!isChecked).toString()));
                        },
                      ),
                    ),
                    const Text(
                      'Al llenar el registro aceptas los términos y condiciones',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 245, 242, 242),
                        ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 30), // Espacio de 20 debajo del Row

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15),  // Ajusta el valor de padding según tus necesidades
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                        onPressed: () {
                          // Lógica para el botón "Regístrate"
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFde455f), // Color de fondo personalizado
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Redondea el botón
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15), // Añade el padding al botón
                          child: Text(
                            'Regístrate',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Texto en negrilla
                              color: Colors.white, // Color del texto en blanco
                            ),
                          ),
                        ),
                      )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      const Text(
                        '¿Ya tiene una cuenta?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 245, 242, 242), // Color de texto personalizado
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10), // Espacio horizontal entre la etiqueta y el botón
                      TextButton(
                        onPressed: () {
                          // Lógica para el botón "Inicio de Sesión"
                        },
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // Texto en negrilla
                            color: Color(0xFFde455f), // Color del texto en blanco
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            ),
          );
  }
}


          // const Image(
          //   image: NetworkImage('https://avatars.githubusercontent.com/u/109951?s=400&v=4'),
          //   fit: BoxFit.cover,
          //   height: 140,
          // ),