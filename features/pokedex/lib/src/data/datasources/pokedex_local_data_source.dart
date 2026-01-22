import 'package:pokedex/src/data/models/response/response.dart';

abstract class PokedexLocalDataSource {
  Future<String?> getPokemons();
  void setPokemons(PokemonResponse pokemonResponse);
}
