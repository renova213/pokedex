import 'package:dependencies/dependencies.dart';
import 'package:pokedex/src/data/datasources/pokedex_local_data_source.dart';
import 'package:pokedex/src/data/models/response/response.dart';

class PokedexLocalDataSourceImpl implements PokedexLocalDataSource {
  @override
  Future<String?> getPokemons() async {
    final sharedPreference = await SharedPreferences.getInstance();

    return sharedPreference.getString("pokemons");
  }

  @override
  void setPokemons(PokemonResponse pokemonResponse) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString("pokemons", pokemonResponse.toJson().toString());
  }
}
