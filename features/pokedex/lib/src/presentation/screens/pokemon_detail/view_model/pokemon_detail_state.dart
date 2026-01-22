import 'package:dependencies/dependencies.dart';
import 'package:pokedex/src/domain/entity/entity.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object?> get props => [];
}

class PokemonDetailInitial extends PokemonDetailState {
  const PokemonDetailInitial();
}

class PokemonDetailLoading extends PokemonDetailState {
  final List<PokemonItemEntity> pokemons;
  final int currentIndex;

  const PokemonDetailLoading({
    required this.pokemons,
    required this.currentIndex,
  });

  @override
  List<Object?> get props => [pokemons, currentIndex];
}

class PokemonDetailLoaded extends PokemonDetailState {
  final PokemonDetailEntity pokemon;
  final List<PokemonItemEntity> pokemons;
  final int currentIndex;

  const PokemonDetailLoaded({
    required this.pokemon,
    required this.pokemons,
    required this.currentIndex,
  });

  PokemonItemEntity get currentItem => pokemons[currentIndex];

  @override
  List<Object?> get props => [pokemon, pokemons, currentIndex];
}

class PokemonDetailError extends PokemonDetailState {
  final String message;
  final List<PokemonItemEntity> pokemons;
  final int currentIndex;

  const PokemonDetailError({
    required this.message,
    required this.pokemons,
    required this.currentIndex,
  });

  @override
  List<Object?> get props => [message, pokemons, currentIndex];
}
