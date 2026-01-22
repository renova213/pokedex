import 'package:dependencies/dependencies.dart';
import 'package:pokedex/src/domain/entity/entity.dart';
import 'package:pokedex/src/domain/usecase/usecases.dart';
import 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  final GetPokemonDetailUseCase getPokemonDetailUseCase;

  late final List<PokemonItemEntity> _pokemons;
  int _currentIndex = 0;

  PokemonDetailCubit(this.getPokemonDetailUseCase)
    : super(const PokemonDetailInitial());

  void init({
    required List<PokemonItemEntity> pokemons,
    required int initialIndex,
  }) {
    _pokemons = pokemons;
    _currentIndex = initialIndex;

    _fetchCurrentPokemon();
  }

  Future<void> _fetchCurrentPokemon() async {
    emit(
      PokemonDetailLoading(pokemons: _pokemons, currentIndex: _currentIndex),
    );

    final name = _pokemons[_currentIndex].name;

    final result = await getPokemonDetailUseCase(name);

    result.fold(
      (error) {
        emit(
          PokemonDetailError(
            message: error.message,
            pokemons: _pokemons,
            currentIndex: _currentIndex,
          ),
        );
      },
      (pokemon) {
        emit(
          PokemonDetailLoaded(
            pokemon: pokemon,
            pokemons: _pokemons,
            currentIndex: _currentIndex,
          ),
        );
      },
    );
  }

  void next() {
    if (_currentIndex < _pokemons.length - 1) {
      _currentIndex++;
      _fetchCurrentPokemon();
    }
  }

  void prev() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _fetchCurrentPokemon();
    }
  }

  bool get canGoNext => _currentIndex < _pokemons.length - 1;
  bool get canGoPrev => _currentIndex > 0;
}
