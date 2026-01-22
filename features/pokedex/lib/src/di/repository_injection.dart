import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:pokedex/src/domain/usecase/usecases.dart';
import 'package:pokedex/src/presentation/screens/dashboard/view_model/view_model.dart';
import 'package:pokedex/src/presentation/screens/pokemon_detail/view_model/pokemon_detail_cubit.dart';

final pokedexRepositories = <RepositoryProvider>[
  RepositoryProvider<GetPokemonsUseCase>(
    create: (_) => locator<GetPokemonsUseCase>(),
  ),
  RepositoryProvider<GetPokemonDetailUseCase>(
    create: (_) => locator<GetPokemonDetailUseCase>(),
  ),
];

final pokedexCubits = <BlocProvider>[
  BlocProvider(create: (_) => PokemonCubit(locator())),
  BlocProvider(create: (_) => PokemonDetailCubit(locator())),
];
