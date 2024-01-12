

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/result_provider.dart';
//import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:riverpod_app/presentation/screens/custom_widgets/custom_widgets.dart';
import 'package:riverpod_app/config/router/app_router.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
 
// ignore: must_be_immutable
class LoginScreen extends ConsumerWidget {
  //TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isChecked = true;
 
  LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controllerUsername = ref.read(usernameControllerProvider);
    Future login() async{
      if (controllerUsername.text=="" || controllerPassword.text=="") {
        Fluttertoast.showToast(
          msg: "Debe llenar ambas filas, porfavor!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
          );
      } else {
              
        var url = Uri.parse('https://shirleytesisbd.000webhostapp.com/login.php');
        var response = await http.post(url, body:{
            "nickname" : controllerUsername.text,
            "password" : controllerPassword.text, 
        });
        var data = json.decode(response.body);
        if (data == "Success"){
          ref.read(appRouterProvider).go('/dashboard');
        } else{
          Fluttertoast.showToast(
            msg: "El usuario o la contraseña esta incorrrecta",
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
                  "Inicio de Sesión",
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
                        'Usuario',
                        'Ingrese un nombre de usuario',
                        30,
                        controller: controllerUsername,
                        onChanged: (text) {
                          //ref.read(loginNotifierProvider.notifier).mapEventsToState(LoginUsernameChanged(text: controllerUsername.value.text),);
                          //ref.read(userInformationProvider);

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
                    'Recordarme',
                    style: TextStyle(
                      fontSize: 16,
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
                            login();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Iniciar sesión',
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
                      '¿No tiene una cuenta?',
                      style: TextStyle(
                        //color: Color.fromARGB(255, 245, 242, 242),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        // Lógica para ir a "Registro"
                        ref.read(appRouterProvider).go('/register');
                      },
                      child: const Text(
                        'Regístrate',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),);
  }
}
