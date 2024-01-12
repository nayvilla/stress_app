


// ignore_for_file: prefer_const_declarations, unnecessary_null_comparison
// ignore: file_names
import 'dart:async';
import 'package:http/http.dart' as http;
//import 'package:riverpod_app/presentation/screens/screens.dart';

class ConsultarResultadoApi {
  //final InsertarResultadoMetodo _InsertarResultadoMetodo = InsertarResultadoMetodo();
  static Future<String> getResultado(String usuario) async {
    

          final uri0 = 'https://shirleytesisbd.000webhostapp.com/ReporteConsulta.php';        
          Map<String, String> map0 = {"username": usuario};

          try {
            http.Response res0 = await http.post(Uri.parse(uri0), body: map0);

            if (res0.statusCode == 200) {
              var responseReporteConsulta = res0.body;
              if (responseReporteConsulta.contains('"respuesta":') && responseReporteConsulta.contains('"BAD"')){
                 return 'Error al guardar al cargar los datos.'; 
              } else{
                  return responseReporteConsulta;
              }
             
            } else {
              return 'Error al guardar al cargar los datos: Código de estado ${res0.statusCode}';
            }
          } catch (e) {
            //print('Error al obtener el cronograma: $e');
             return 'Error al cargar los datos: $e'; // Lanza una excepción
          }

    
  }
}