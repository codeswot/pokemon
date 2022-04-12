import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../models/pokemon_model.dart';
import '../../models/pokemons_model.dart';

class ApiServices {
  Future<Pokemon?> getPokemonById(String id,
      {required BuildContext context}) async {
    try {
      final String uri = 'http://pokemon.test.dormzi.com/pokemon/$id';
      final url = Uri.parse(uri);
      final res = await http.get(url);

      final pokemon = pokemonFromMap(res.body);
      return pokemon;
    } catch (e) {
      if (kDebugMode) {
        print('Error [getPokemonById]$e');
      }
      context.go('/error');
      return null;
    }
  }

  Future<List<Pokemons>?> getAllPokemon() async {
    try {
      const String uri = 'http://pokemon.test.dormzi.com/pokemon';
      final url = Uri.parse(uri);
      final res = await http.get(url);

      final pokemons = pokemonsFromMap(res.body);
      return pokemons;
    } catch (e) {
      if (kDebugMode) {
        print('Error [getAllPokemon]$e');
      }
      return [];
    }
  }
}
