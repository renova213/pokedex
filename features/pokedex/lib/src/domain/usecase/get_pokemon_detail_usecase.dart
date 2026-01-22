import 'package:core/core.dart';
import 'package:pokedex/src/domain/entity/entity.dart';
import 'package:pokedex/src/domain/repository/pokedex_repository.dart';

class GetPokemonDetailUseCase implements UseCase<PokemonDetailEntity, String> {
  final PokedexRepository repository;

  GetPokemonDetailUseCase(this.repository);

  @override
  Future<Either<AppError, PokemonDetailEntity>> call(String name) {
    return repository.getPokemonDetail(name);
  }
}
