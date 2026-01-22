import 'dart:convert';

import 'package:dependencies/dependencies.dart';
import 'package:pokedex/src/data/datasources/pokedex_local_data_source.dart';

class PokedexLocalDataSourceImpl implements PokedexLocalDataSource {
  @override
  Future<String?> getPokemons() async {
    final sharedPreference = await SharedPreferences.getInstance();

    return sharedPreference.getString("pokemons");
  }

  @override
  void setPokemons(Map<String, dynamic> pokemonResponse) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString("pokemons", jsonEncode(pokemonResponse));
  }
}
