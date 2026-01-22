import 'package:pokedex/src/domain/entity/pokemon_entity.dart';
import 'package:dependencies/dependencies.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {
  const PokemonInitial();
}

class PokemonLoading extends PokemonState {
  const PokemonLoading();
}

class PokemonLoaded extends PokemonState {
  final List<PokemonItemEntity> visiblePokemons;
  final int currentPage;
  final int totalPage;
  final String searchQuery;

  const PokemonLoaded({
    required this.visiblePokemons,
    required this.currentPage,
    required this.totalPage,
    required this.searchQuery,
  });

  @override
  List<Object?> get props => [
    visiblePokemons,
    currentPage,
    totalPage,
    searchQuery,
  ];
}

class PokemonError extends PokemonState {
  final String message;

  const PokemonError(this.message);

  @override
  List<Object?> get props => [message];
}
