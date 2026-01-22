import 'package:dependencies/dependencies.dart';

class PokemonDetailEntity extends Equatable {
  final int id;
  final String name;
  final int height;
  final int weight;
  final String imageUrl;
  final String description;
  final List<PokemonTypeEntity> types;
  final List<PokemonStatEntity> stats;
  final List<String> abilities;

  const PokemonDetailEntity({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.imageUrl,
    required this.types,
    required this.stats,
    required this.abilities,
    required this.description,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    height,
    weight,
    imageUrl,
    types,
    stats,
    abilities,
    description,
  ];
}

class PokemonTypeEntity extends Equatable {
  final String name;

  const PokemonTypeEntity({required this.name});

  @override
  List<Object?> get props => [name];
}

class PokemonStatEntity extends Equatable {
  final String name;
  final int baseStat;

  const PokemonStatEntity({required this.name, required this.baseStat});

  @override
  List<Object?> get props => [name, baseStat];
}
