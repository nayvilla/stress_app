// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

String obtenerFechaActual() {
  final now = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}

class Constants {
  static const bool light = true;
  static const String username = 'Username_example';
  static const String fullname = 'John Doe';
  static const String password = '12345678.';
  static const String country = 'Ecuador';
  static const String province = "Tungurahua";
  static const String city = "Ambato";
  static const String email = "example@gmail.com";
  static String age = obtenerFechaActual();
  static final List<String> opcionPregunta = ['0','1', '2', '3','4', '5'];
  static const String estadoPreguntaInicial = '0';
}