import 'package:core/core.dart';
import 'package:pokedex/src/data/data.dart';
import 'package:pokedex/src/data/datasources/pokedex_local_data_source.dart';
import 'package:pokedex/src/data/datasources/pokedex_local_data_source_impl.dart';
import 'package:pokedex/src/domain/domain.dart';
import 'package:pokedex/src/presentation/screens/dashboard/view_model/view_model.dart';
import 'package:pokedex/src/presentation/screens/pokemon_detail/view_model/pokemon_detail_cubit.dart';

Future<void> pokedexInjection() async {
  // Datasource

  /// local
  locator.registerFactory<PokedexLocalDataSource>(
    () => PokedexLocalDataSourceImpl(),
  );

  /// remote
  locator.registerFactory<PokedexRemoteDatasource>(
    () => PokedexRemoteDatasourceImpl(locator(), locator()),
  );

  // Repository
  locator.registerFactory<PokedexRepository>(
    () => PokedexRepositoryImpl(locator()),
  );

  // Usecase
  locator.registerFactory<GetPokemonsUseCase>(
    () => GetPokemonsUseCase(locator()),
  );
  locator.registerFactory<GetPokemonDetailUseCase>(
    () => GetPokemonDetailUseCase(locator()),
  );

  // Cubit
  locator.registerFactory<PokemonCubit>(() => PokemonCubit(locator()));
  locator.registerFactory<PokemonDetailCubit>(
    () => PokemonDetailCubit(locator()),
  );
}
