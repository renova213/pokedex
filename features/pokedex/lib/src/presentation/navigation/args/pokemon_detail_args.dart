import 'package:pokedex/src/domain/entity/entity.dart';

class PokemonDetailArgs {
  final List<PokemonItemEntity> pokemonList;
  final PokemonItemEntity pokemon;
  final int index;

  const PokemonDetailArgs({
    required this.pokemonList,
    required this.pokemon,
    required this.index,
  });
}
