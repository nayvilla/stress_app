// ignore: file_names
import 'package:dio/dio.dart';

class ResultadoEstres {


  static Future<String> getResultadoEstres() async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response = await dio.get('https://api-shirley.onrender.com');

      return response.data['resultado'] ?? 'Comprube su conexión a Internet';

    } catch (e) {
      return 'Porfavor compruebe su conexión a internet';
    }

  }


}