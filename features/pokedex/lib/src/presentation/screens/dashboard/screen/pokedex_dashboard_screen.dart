import 'package:config/config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/presentation/screens/dashboard/widgets/widgets.dart';
import 'package:pokedex/src/presentation/screens/dashboard/view_model/view_model.dart';
import 'package:shared_components/shared_components.dart';

class PokedexDashboardScreen extends StatelessWidget {
  const PokedexDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            8.0.imVerticalSpace(),

            SearchPokemonBar(
              initialValue: context.watch<PokemonCubit>().searchQuery,
            ),

            Expanded(
              child: BlocBuilder<PokemonCubit, PokemonState>(
                builder: (context, state) {
                  if (state is PokemonInitial) {
                    return const SizedBox.shrink();
                  }

                  if (state is PokemonLoading) {
                    return Center(
                      child: const CircularProgressIndicator(
                        color: AppColors.white,
                      ),
                    );
                  }

                  if (state is PokemonError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  if (state is PokemonLoaded) {
                    return Column(
                      children: [
                        Expanded(
                          child: PokemonList(pokemons: state.visiblePokemons),
                        ),
                        PaginationBar(
                          currentPage: state.currentPage,
                          totalPage: state.totalPage,
                        ),
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
