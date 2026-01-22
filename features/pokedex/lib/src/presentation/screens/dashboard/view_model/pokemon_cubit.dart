import 'package:dependencies/dependencies.dart';
import 'package:pokedex/src/domain/entity/entity.dart';
import 'package:pokedex/src/domain/usecase/params/params.dart';
import 'package:pokedex/src/domain/usecase/usecases.dart';
import 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final GetPokemonsUseCase getPokemonUseCase;

  PokemonCubit(this.getPokemonUseCase) : super(const PokemonInitial());

  static const int _pageSize = 24;

  List<PokemonItemEntity> _allPokemons = [];
  List<PokemonItemEntity> _filteredPokemons = [];

  int _currentPage = 1;
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  // MARK: APIs
  Future<void> fetchPokemons() async {
    emit(const PokemonLoading());

    final result = await getPokemonUseCase(
      const GetPokemonsParams(limit: 99999, offset: 0),
    );

    result.fold(
      (error) {
        emit(PokemonError(error.message));
        AppLog.logger.e(error.originalError);
      },
      (entity) {
        _allPokemons = entity.pokemonList;
        _applySearch('');
      },
    );
  }

  // MARK: Search Local
  void search(String query) {
    _applySearch(query);
  }

  void clearSearch() {
    _applySearch('');
  }

  void _applySearch(String query) {
    _searchQuery = query.toLowerCase();
    _currentPage = 1;

    if (_searchQuery.isEmpty) {
      _filteredPokemons = _allPokemons;
    } else {
      _filteredPokemons = _allPokemons
          .where((pokemon) => pokemon.name.toLowerCase().contains(_searchQuery))
          .toList();
    }

    _emitPokemonState();
  }

  // MARK: Pagination
  void nextPage() {
    if (_currentPage < totalPage) {
      _currentPage++;
      _emitPokemonState();
    }
  }

  void prevPage() {
    if (_currentPage > 1) {
      _currentPage--;
      _emitPokemonState();
    }
  }

  int get totalPage => (_filteredPokemons.length / _pageSize).ceil();

  void _emitPokemonState() {
    final start = (_currentPage - 1) * _pageSize;
    final end = start + _pageSize;

    final visiblePokemons = _filteredPokemons.sublist(
      start,
      end > _filteredPokemons.length ? _filteredPokemons.length : end,
    );

    emit(
      PokemonLoaded(
        visiblePokemons: visiblePokemons,
        currentPage: _currentPage,
        totalPage: totalPage,
        searchQuery: _searchQuery,
      ),
    );
  }
}
