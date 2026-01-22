import 'package:config/config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/domain/entity/entity.dart';
import 'package:pokedex/src/presentation/navigation/args/pokemon_detail_args.dart';
import 'package:pokedex/src/presentation/screens/dashboard/widgets/widgets.dart';
import 'package:pokedex/src/routes/routes.dart';

class PokemonList extends StatelessWidget {
  final List<PokemonItemEntity> pokemons;

  const PokemonList({super.key, required this.pokemons});

  @override
  Widget build(BuildContext context) {
    if (pokemons.isEmpty) {
      return const NotFoundData();
    }

    return Container(
      margin: EdgeInsets.only(left: 4, right: 4, top: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return PokemonCard(
            id: pokemon.id,
            name: pokemon.name,
            imageUrl: pokemon.imageUrl,
            onTap: () {
              context.push(
                PokedexRoutes.pokedexDetail,
                extra: PokemonDetailArgs(
                  index: index,
                  pokemonList: pokemons,
                  pokemon: pokemon,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
