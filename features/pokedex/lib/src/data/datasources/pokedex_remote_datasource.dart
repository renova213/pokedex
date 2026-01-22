import 'package:pokedex/src/data/models/request/request.dart';
import 'package:pokedex/src/data/models/response/response.dart';

abstract class PokedexRemoteDatasource {
  Future<PokemonResponse> getPokemons(PokemonRequest request);
  Future<PokemonDetailResponse> getPokemonDetail(String name);
}
