abstract class PokedexLocalDataSource {
  Future<String?> getPokemons();
  void setPokemons(Map<String, dynamic> pokemonResponse);
}
