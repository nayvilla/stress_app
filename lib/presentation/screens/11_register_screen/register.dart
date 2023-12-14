
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:riverpod_app/presentation/screens/custom_widgets/custom_widgets.dart';
import 'package:riverpod_app/config/helpers/Constants.dart';
import 'package:riverpod_app/config/router/app_router.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class RegisterScreen extends ConsumerWidget {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastname = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String? fechaNacimiento = Constants.age;
  TextEditingController controllerEmail = TextEditingController(); 
  bool isChecked = true;
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // ignore: unused_local_variable
    final helloWorld = ref.watch( holaMundoProvider );
    Future register() async{
      if (controllerName.text=="" || controllerLastname.text==""
          || controllerUsername.text=="" || controllerPassword.text==""
          || fechaNacimiento=="" || controllerEmail.text=="") {
        Fluttertoast.showToast(
          msg: "Debe llenar todas las filas, porfavor!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
          );
      } else {
              
        var url = Uri.parse('https://stressappshirleybd.000webhostapp.com/register.php');
        var uuid = const Uuid();
        String nuevoUuid = uuid.v4();
        var response = await http.post(url, body:{
            "id_usuario" : nuevoUuid,
            "username" : controllerName.text,
            "userlastname" : controllerLastname.text,
            "nickname" : controllerUsername.text,
            "password" : controllerPassword.text,
            "userdate" : fechaNacimiento,
            "useremail" : controllerEmail.text,
        });
        var data = json.decode(response.body);
        if (data == "Success"){
          ref.read(appRouterProvider).go('/login');
        } else{
          Fluttertoast.showToast(
            msg: "Error al registrarse",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0, 
            );
        }
      }
  }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Lógica para regresar
            ref.read(appRouterProvider).go('/');
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Porfavor regístrate",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //color: Color.fromARGB(255, 245, 242, 242),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: customTextField(
                        'Nombre',
                        'Ingrese su nombre',
                        30,
                        controller: controllerName,
                        onChanged: (text) {
                          //ref.read(loginNotifierProvider.notifier).mapEventsToState(LoginUsernameChanged(text: controllerUsername.value.text),);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: customTextField(
                        'Apellido',
                        'Ingrese su apellido',
                        30,
                        controller: controllerLastname,
                        onChanged: (text) {
                          //ref.read(loginNotifierProvider.notifier).mapEventsToState(LoginUsernameChanged(text: controllerUsername.value.text),);
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
                        'Usuario',
                        'Ingrese un nombre de usuario',
                        30,
                        controller: controllerUsername,
                        onChanged: (text) {
                          //ref.read(loginNotifierProvider.notifier).mapEventsToState(LoginUsernameChanged(text: controllerUsername.value.text),);
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
                        'Contraseña',
                        'Ingrese una contraseña',
                        30,
                        controller: controllerPassword,
                        onChanged: (text) {
                          //ref.read(loginNotifierProvider.notifier).mapEventsToState(LoginUsernameChanged(text: controllerUsername.value.text),);
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
                      height: 80,
                      child: customDateInput(
                  'Fecha de Nacimiento',
                  'Seleccione la fecha de nacimiento',
                  fechaNacimiento,
                  (String? value) {
                    fechaNacimiento = value;
                    //ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoAgeChanged(text: fechaNacimiento ?? ''),);
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
                        'Correo electrónico',
                        'Ingrese su email',
                        30,
                        controller: controllerEmail,
                        onChanged: (text) {
                          //ref.read(loginNotifierProvider.notifier).mapEventsToState(LoginUsernameChanged(text: controllerUsername.value.text),);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
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
                        //ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoCheckboxChanged(text: (!isChecked).toString()));
                      },
                    ),
                  ),
                  const Text(
                    'Al registrarse acepta los términos y condiciones',
                    style: TextStyle(
                      fontSize: 12,
                      //color: Color.fromARGB(255, 245, 242, 242),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Regístrate"
                            register();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFde455f),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Regístrate',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Text(
                      '¿Ya tiene una cuenta?',
                      style: TextStyle(
                        //color: Color.fromARGB(255, 245, 242, 242),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        // Lógica para ir a "Inicio de Sesión"
                        ref.read(appRouterProvider).go('/login');
                      },
                      child: const Text(
                        'Inicia Sesión',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFde455f),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),),
        ),
      ),
    );
  }
}