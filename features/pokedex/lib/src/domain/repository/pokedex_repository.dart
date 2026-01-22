import 'package:core/core.dart';
import 'package:pokedex/src/domain/entity/entity.dart';

abstract class PokedexRepository {
  Future<Either<AppError, PokemonEntity>> getPokemons(int limit, int offset);
  Future<Either<AppError, PokemonDetailEntity>> getPokemonDetail(String name);
}
