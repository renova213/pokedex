import 'package:core/core.dart';
import 'package:pokedex/src/data/datasources/pokedex_remote_datasource.dart';
import 'package:pokedex/src/data/models/request/request.dart';
import 'package:pokedex/src/domain/entity/pokemon_detail_entity.dart';
import 'package:pokedex/src/domain/entity/pokemon_entity.dart';
import 'package:pokedex/src/domain/repository/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final PokedexRemoteDatasource remoteDatasource;

  PokedexRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<AppError, PokemonEntity>> getPokemons(
    int limit,
    int offset,
  ) async {
    return safeApiCall(() async {
      final model = await remoteDatasource.getPokemons(
        PokemonRequest(limit: limit, offset: offset),
      );
      return model.toEntity();
    });
  }

  @override
  Future<Either<AppError, PokemonDetailEntity>> getPokemonDetail(String name) {
    return safeApiCall(() async {
      final model = await remoteDatasource.getPokemonDetail(name);
      return model.toEntity();
    });
  }
}
