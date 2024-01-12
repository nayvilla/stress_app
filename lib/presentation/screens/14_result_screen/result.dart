// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:riverpod_app/config/router/app_router.dart';
import 'package:riverpod_app/config/config.dart';


class ResultScreen extends ConsumerWidget {

  ResultScreen({super.key});
  final InsertarResultadoMetodo _InsertarResultadoMetodo = InsertarResultadoMetodo();
  final LoginViewError _mensajeError = LoginViewError();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: 380, // Puedes ajustar el tamaño según tus necesidades
                    height: 100, // Puedes ajustar el tamaño según tus necesidades
                    //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: resultadoAsync.when(
                        data: (resultado) => Text(resultado,
                                style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),), 
                        error: ( _, __ ) => const Text('Revisa tu conexión a internet.'), 
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
                            ref.read(resultestresProvider.notifier).update((state) => state + 1);
                            await _InsertarResultadoMetodo.postResultado(
                              context,
                              ref,
                            );
                            // ignore: use_build_context_synchronously
                            _mensajeError.alertError(context, 'Carga de datos', 'Tus datos se han cargado correctammente');
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
                    "Consejos para tu bienestar",
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Cambia el color de fondo según tus necesidades
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Alto"
                            screenTratamientoBajo(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 50),
                            primary: Colors.transparent, // Fondo transparente
                            elevation: 0, // Sin sombra
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Bajo',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 19, 13, 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Cambia el color de fondo según tus necesidades
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Alto"
                            screenTratamientoModerado(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 50),
                            primary: Colors.transparent, // Fondo transparente
                            elevation: 0, // Sin sombra
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Moderado',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 19, 13, 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Cambia el color de fondo según tus necesidades
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Alto"
                            screenTratamientoAlto(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 50),
                            primary: Colors.transparent, // Fondo transparente
                            elevation: 0, // Sin sombra
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Alto',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 19, 13, 13),
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
                            // Lógica para el botón "Reporte"
                            ref.read(appRouterProvider).go('/report');                            
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
                              'Ver Reporte',
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

  class InsertarResultadoMetodo {
  // ignore: unused_field
  final LoginViewError _mensajeError = LoginViewError();

  // Función asincrónica para manejar el inicio de sesión
  Future<void> postResultado(BuildContext context, WidgetRef ref,) async {
    // Llamada al método de inicio de sesión
    ref.watch( insertResultProvider);
    final postResultadoApi = await ref.read(insertResultProvider.future);
    //Mapeo de la respuesta del API
    if (postResultadoApi.startsWith('Error')) {
    // ignore: use_build_context_synchronously
    _mensajeError.alertError(context, 'Error al cargar sus datos', postResultadoApi);
    return;
  }   
  }
}

class LoginViewError {
  // Función asincrónica para manejar el inicio de sesión
       // ignore: unused_element
      Future<void> alertError(BuildContext context, String title, String message) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Aceptar'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

}