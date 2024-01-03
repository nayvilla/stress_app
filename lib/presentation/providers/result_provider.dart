import 'package:flutter_riverpod/flutter_riverpod.dart';
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

