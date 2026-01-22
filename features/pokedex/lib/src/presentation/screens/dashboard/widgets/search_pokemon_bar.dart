import 'package:config/config.dart';
import 'package:shared_components/shared_components.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/presentation/screens/dashboard/view_model/pokemon_cubit.dart';

class SearchPokemonBar extends StatelessWidget {
  final String initialValue;

  const SearchPokemonBar({super.key, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return AppSearchBar(
      initialValue: initialValue,
      onClear: () {
        context.read<PokemonCubit>().search('');
      },
      hintText: "Search",
      onChanged: (value) {
        context.read<PokemonCubit>().search(value);
      },
      height: 38,
      borderColor: Colors.transparent,
      prefixIcon: Image.asset(
        AppAssets.icons.icSearchRead,
        package: AppAssets.pkg,
        width: 20,
        height: 20,
      ),
      fontSize: .micro,
    );
  }
}
