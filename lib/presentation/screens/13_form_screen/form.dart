// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:riverpod_app/presentation/screens/custom_widgets/custom_widgets.dart';
import 'package:riverpod_app/config/router/app_router.dart';
import 'package:riverpod_app/config/helpers/Constants.dart';
import 'package:riverpod_app/domain/event/event.dart';


class FormScreen extends ConsumerWidget {

  const FormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String? selectedEstadoP1 = Constants.estadoPreguntaInicial;
    String? selectedEstadoP2 = Constants.estadoPreguntaInicial;
    String? selectedEstadoP3 = Constants.estadoPreguntaInicial;
    String? selectedEstadoP4 = Constants.estadoPreguntaInicial;
    String? selectedEstadoP5 = Constants.estadoPreguntaInicial;
    String? selectedEstadoP6 = Constants.estadoPreguntaInicial;
    String? selectedEstadoP7 = Constants.estadoPreguntaInicial;
    String? selectedEstadoP8 = Constants.estadoPreguntaInicial;

    Future formulario() async{
           
          var url = Uri.parse('https://shirleytesisbd.000webhostapp.com/formulario.php');

          var response = await http.post(url, body:{
              "pregunta1" : selectedEstadoP1,
              "pregunta2" : selectedEstadoP2,
              "pregunta3" : selectedEstadoP3,
              "pregunta4" : selectedEstadoP4,
              "pregunta5" : selectedEstadoP5,
              "pregunta6" : selectedEstadoP6,
              "pregunta7" : selectedEstadoP7,
              "pregunta8" : selectedEstadoP8,
          });
          var data = json.decode(response.body);
          if (data == "Success"){
            ref.read(appRouterProvider).go('/result');
          } else{
            Fluttertoast.showToast(
              msg: "Error al registrar sus respuestas",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              fontSize: 16.0, 
              );
          }
  
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
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
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Responde el siguiente formulario asignando un valor, donde (1) es poco y (5) mucho según como te afecte cada parámetro, en base a tu nivel de estrés.",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 93, 74),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customDropdown(
                          '¿Cómo describes tu nivel actual de estrés?',
                          Constants.opcionPregunta,
                          selectedEstadoP1,
                          (String? value) {
                            selectedEstadoP1 = value;
                            ref.read(formNotifierProvider.notifier).mapEventsToState(FormPregunta1Changed(text: selectedEstadoP1 ?? ''),);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customDropdown(
                          '¿Cuanto estrés sientes por la sobrecarga de tareas?',
                          Constants.opcionPregunta,
                          selectedEstadoP2,
                          (String? value) {
                            selectedEstadoP2 = value;
                            ref.read(formNotifierProvider.notifier).mapEventsToState(FormPregunta2Changed(text: selectedEstadoP2 ?? ''),);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customDropdown(
                          '¿Cuanto te estresan las evaluaciones?',
                          Constants.opcionPregunta,
                          selectedEstadoP3,
                          (String? value) {
                            selectedEstadoP3 = value;
                            ref.read(formNotifierProvider.notifier).mapEventsToState(FormPregunta3Changed(text: selectedEstadoP3 ?? ''),);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customDropdown(
                          '¿Cuanto te estresa el tipo de trabajo asignado?',
                          Constants.opcionPregunta,
                          selectedEstadoP4,
                          (String? value) {
                            selectedEstadoP4 = value;
                            ref.read(formNotifierProvider.notifier).mapEventsToState(FormPregunta4Changed(text: selectedEstadoP4 ?? ''),);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customDropdown(
                          '¿Cuanto te estresa el límite de tiempo para tareas?',
                          Constants.opcionPregunta,
                          selectedEstadoP5,
                          (String? value) {
                            selectedEstadoP5 = value;
                            ref.read(formNotifierProvider.notifier).mapEventsToState(FormPregunta5Changed(text: selectedEstadoP5 ?? ''),);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customDropdown(
                          '¿Con que frecuencia sientes fatiga crónica?',
                          Constants.opcionPregunta,
                          selectedEstadoP6,
                          (String? value) {
                            selectedEstadoP6 = value;
                            ref.read(formNotifierProvider.notifier).mapEventsToState(FormPregunta6Changed(text: selectedEstadoP6 ?? ''),);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customDropdown(
                          '¿Con que frecuencia tienes problemas de concentración?',
                          Constants.opcionPregunta,
                          selectedEstadoP7,
                          (String? value) {
                            selectedEstadoP7 = value;
                            ref.read(formNotifierProvider.notifier).mapEventsToState(FormPregunta7Changed(text: selectedEstadoP7 ?? ''),);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: customDropdown(
                          '¿Con que frecuencia sientes desgano?',
                          Constants.opcionPregunta,
                          selectedEstadoP8,
                          (String? value) {
                            selectedEstadoP8 = value;
                            ref.read(formNotifierProvider.notifier).mapEventsToState(FormPregunta8Changed(text: selectedEstadoP8 ?? ''),);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
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
                            // Lógica para el botón "Formulario"
                            ref.read(formNotifierProvider.notifier).mapEventsToState( const AddTodo() );
                            formulario();
                            //print('Seleccion preguntas: $selectedEstadoP1, $selectedEstadoP2, $selectedEstadoP3, $selectedEstadoP4, $selectedEstadoP5, $selectedEstadoP6, $selectedEstadoP7, $selectedEstadoP8');
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
                              'Obtener Resultados',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
