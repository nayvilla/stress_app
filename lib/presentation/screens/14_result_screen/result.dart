// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_app/domain/event/event.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:riverpod_app/config/router/app_router.dart';
import 'package:dio/dio.dart';


class ResultScreen extends ConsumerWidget {

  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //String apiResponse = '';

    // Future<void> result() async {
    //   final dio = Dio();
    //   try {
    //     final response = await dio.get('https://api-shirley.onrender.com');
    //     //var url = Uri.parse('https://api-shirley.onrender.com');

    //     //var response = await http.get(url);
    //     //apiResponse = response.body;
    //     apiResponse= response.data['resultado'] ?? 'Comprube su conexión a Internet';

    //     // Imprimir la respuesta del API
    //     print('Respuesta del API: $apiResponse');

    //     //var data = json.decode(response.body);
    //     //if (data == "Success") {
    //     //  ref.read(appRouterProvider).go('/login');


    //    // } 
    //   } catch (error) {
    //     // Manejar errores aquí
    //     print('Error al realizar la solicitud GET: $error');
    //     Fluttertoast.showToast(
    //       msg: "Por favor, revise su conexión a Internet.",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       fontSize: 16.0,
    //     );
    //   }
    // }
    //final pokemonAsync = ref.watch( pokemonNameProvider );
    final resultadoAsync = ref.watch( resultadoestresProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(appRouterProvider).go('/form');
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
                    "Resultados",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: 380, // Puedes ajustar el tamaño según tus necesidades
                    height: 100, // Puedes ajustar el tamaño según tus necesidades
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 37, 227, 176),
                      borderRadius: BorderRadius.circular(20), // Ajusta el radio según tus preferencias
                    ),
                    child: Center(
                      child: resultadoAsync.when(
                        data: (resultado) => Text(resultado), 
                        error: ( _, __ ) => const Text('No se pudo cargar el nombre'), 
                        loading: () => const CircularProgressIndicator(),
                      )                    
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                               
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Lógica para el botón "Mostrar Resultado"
                            //await result();
                            //ref.read(formNotifierProvider.notifier).mapEventsToState(FormResultadoChanged(text: apiResponse));
                            ref.read(resultestresProvider.notifier).update((state) => state + 1);
                            
                            
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
                              'Mostrar Resultados',
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

              const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Tratamiento",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Bajo"
                            screenTratamientoBajo(context);
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 37, 227, 176),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Bajo',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 19, 13, 13),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Moderado"
                            screenTratamientoModerado(context);
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 37, 227, 176),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Moderado',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 19, 13, 13),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SizedBox(
                        height: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Alto"
                            screenTratamientoAlto(context);
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 37, 227, 176),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Alto',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 19, 13, 13),
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
                            // Lógica para el botón "Salir"
                            ref.read(appRouterProvider).go('/');
                            
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
                              'Salir',
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

  void screenTratamientoAlto(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tratamiento estrés alto:'),
          content: const Text('Para gestionar el estrés elevado como estudiante, es crucial implementar estrategias multifacéticas. Planifica y organiza tu tiempo de estudio, dividiendo tareas en partes manejables. Practica técnicas de relajación, como la meditación o la respiración profunda, y asegúrate de realizar ejercicio regularmente. Mantén una dieta equilibrada, prioriza el sueño y busca apoyo social cuando sea necesario. La aplicación consistente en que estos consejos puedan ayudar a mejorar tu bienestar general y a manejar eficazmente el estrés académico.',
                              textAlign: TextAlign.justify,
                              ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra la ventana emergente
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void screenTratamientoModerado(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tratamiento estrés moderado:'),
          content: const Text('Cuando enfrentas un nivel de estrés moderado, adopta medidas preventivas y de manejo. Equilibra tus responsabilidades, establece metas realistas y organiza tu tiempo. Integra pausas durante el estudio y practica actividades relajantes. Mantén hábitos alimenticios saludables, asegúrate de descansar adecuadamente y busca apoyo social. Esta gestión proactiva contribuye a mantener un equilibrio saludable en tu vida cotidiana.',
                              textAlign: TextAlign.justify,
                              ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra la ventana emergente
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void screenTratamientoBajo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tratamiento estrés bajo:'),
          content: const Text('Cuando el nivel de estrés es bajo, es importante mantener prácticas saludables para prevenir que aumente. Continúa organizando tus tareas, aprovecha la oportunidad para incorporar hábitos de autocuidado, como el ejercicio regular y la alimentación equilibrada. Aunque el estrés sea mínimo, sigue priorizando el descanso adecuado y mantén conexiones sociales positivas. Utiliza este periodo para consolidar hábitos que contribuyan a tu bienestar general y fortalezcan tu resiliencia ante posibles desafíos.',
                              textAlign: TextAlign.justify,
                              ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra la ventana emergente
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }