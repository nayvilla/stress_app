

// ignore_for_file: prefer_const_declarations, unnecessary_null_comparison
// ignore: file_names
import 'dart:async';
import 'package:http/http.dart' as http;

class InsertarResultadoApi {
  static Future<String> postResultado(String usuario, String resultado) async {
    

          final uri0 = 'https://shirleytesisbd.000webhostapp.com/reporte.php';        
          Map<String, String> map0 = {"usuario": usuario, "resultado": resultado};

          try {
            http.Response res0 = await http.post(Uri.parse(uri0), body: map0);



            if (res0.statusCode == 200) {

             return 'Datos guardados exitosamente.';

            } else {
              return 'Error al guardar los datos: Código de estado ${res0.statusCode}';
            }
          } catch (e) {
            print('Error al obtener el cronograma: $e');
             return 'Error al guadar los datos: $e'; // Lanza una excepción
          }

    
  }
}