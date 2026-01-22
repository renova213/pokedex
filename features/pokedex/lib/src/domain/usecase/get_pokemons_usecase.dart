import 'package:core/core.dart';
import 'package:pokedex/src/domain/entity/entity.dart';
import 'package:pokedex/src/domain/repository/pokedex_repository.dart';
import 'package:pokedex/src/domain/usecase/params/params.dart';

class GetPokemonsUseCase implements UseCase<PokemonEntity, GetPokemonsParams> {
  final PokedexRepository repository;

  GetPokemonsUseCase(this.repository);

  @override
  Future<Either<AppError, PokemonEntity>> call(GetPokemonsParams params) {
    return repository.getPokemons(params.limit, params.offset);
  }
}
