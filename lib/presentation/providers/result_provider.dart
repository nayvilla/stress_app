import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/config/helpers/apiResult.dart';
import 'package:riverpod_app/config/helpers/apiEstres.dart';

final pokemonNameProvider = FutureProvider<String>((ref) async {

  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;

});

final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});


final pokemonProvider = FutureProvider.family<String, int>((ref, pokemonId ) async {

  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;

});

//Provider api resultado
final resultadoestresProvider = FutureProvider<String>((ref) async {

  final actualizar = ref.watch(resultestresProvider);
  final apiResponse = await ResultadoEstres.getResultadoEstres();
  return apiResponse;

});

final resultestresProvider = StateProvider<int>((ref) {
  return 1;
});


final estresProvider = FutureProvider.family<String, int>((ref, pokemonId ) async {

  final apiResponse = await ResultadoEstres.getResultadoEstres();
  return apiResponse;

});


//Provider Api guardar datos para reporte
//mantener el valor del textcontrollo para hacer la consulta
final usernameControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});


final insertarResultadoApiProvider = Provider<InsertarResultadoApi>((ref) => InsertarResultadoApi());

final insertResultProvider = FutureProvider.autoDispose<String>((ref) async {
  // Accede a la instancia de LoginApi utilizando el Provider anterior
  // ignore: unused_local_variable
  final loginApi = ref.read(insertarResultadoApiProvider);
  // final username = 'josue.ruiz@iste.edu.ec';
  // final password = 'Josue,2930';
  final username = ref.read(usernameControllerProvider).text;
  final resultado = ref.watch( resultadoestresProvider ).value;

  // Realiza la llamada a la API y obtiene el resultado
  final postResultado = await InsertarResultadoApi.postResultado(username, resultado??'');
  return postResultado;
});

//Provider Api cargar datos para reporte
final cargarResultadoApiProvider = Provider<ConsultarResultadoApi>((ref) => ConsultarResultadoApi());

final cargarResultProvider = FutureProvider.autoDispose<String>((ref) async {
  // Accede a la instancia de LoginApi utilizando el Provider anterior
  // ignore: unused_local_variable
  final loginApi = ref.read(cargarResultadoApiProvider);
  final username = ref.read(usernameControllerProvider).text;

  // Realiza la llamada a la API y obtiene el resultado
  final getResultado = await ConsultarResultadoApi.getResultado(username);
  return getResultado;
});