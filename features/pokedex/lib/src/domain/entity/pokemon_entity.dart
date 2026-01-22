import 'package:dependencies/dependencies.dart';

class PokemonEntity extends Equatable {
  final int count;
  final List<PokemonItemEntity> pokemonList;

  const PokemonEntity({required this.count, required this.pokemonList});

  @override
  List<Object?> get props => [count, pokemonList];
}

class PokemonItemEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;

  const PokemonItemEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, imageUrl];
}
