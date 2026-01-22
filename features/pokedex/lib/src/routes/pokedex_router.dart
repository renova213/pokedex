import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:pokedex/src/presentation/navigation/navigation.dart';
import 'package:pokedex/src/presentation/screens/dashboard/screen/pokedex_dashboard_screen.dart';
import 'package:pokedex/src/presentation/screens/dashboard/view_model/view_model.dart';
import 'package:pokedex/src/presentation/screens/pokemon_detail/screen/pokemon_detail_screen.dart';
import 'package:pokedex/src/presentation/screens/pokemon_detail/view_model/pokemon_detail_cubit.dart';
import 'package:pokedex/src/routes/pokedex_routes.dart';

final pokedexRouter = [
  GoRoute(
    path: PokedexRoutes.pokedex,
    builder: (context, state) {
      return BlocProvider(
        create: (_) => PokemonCubit(locator())..fetchPokemons(),
        child: PokedexDashboardScreen(),
      );
    },
  ),

  GoRoute(
    path: PokedexRoutes.pokedexDetail,
    builder: (context, state) {
      final args = state.extra as PokemonDetailArgs;

      return BlocProvider(
        create: (_) =>
            PokemonDetailCubit(locator())
              ..init(pokemons: args.pokemonList, initialIndex: args.index),
        child: PokemonDetailScreen(
          pokemonList: args.pokemonList,
          pokemon: args.pokemon,
          index: args.index,
        ),
      );
    },
  ),
];
