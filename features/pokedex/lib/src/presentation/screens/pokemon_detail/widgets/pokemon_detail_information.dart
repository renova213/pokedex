import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/domain/entity/entity.dart';
import 'package:pokedex/src/extension/color_extension.dart';
import 'package:pokedex/src/presentation/screens/pokemon_detail/widgets/widgets.dart';
import 'package:shared_components/shared_components.dart';

class PokemonDetailInformation extends StatelessWidget {
  final PokemonDetailEntity pokemonDetail;
  const PokemonDetailInformation({super.key, required this.pokemonDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: EdgeInsets.only(top: 56, left: 20, right: 20, bottom: 20),
      width: context.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8, // jarak horizontal
            runSpacing: 8, // jarak vertical
            children: pokemonDetail.types.map((type) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colorStringToType(type.name),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  type.name,
                  style: TextStyleHelper.apply(
                    size: .micro,
                    style: .semiBold,
                    color: AppColors.white,
                  ),
                ),
              );
            }).toList(),
          ),

          16.0.imVerticalSpace(),

          Text(
            "About",
            style: TextStyleHelper.apply(
              size: .body1,
              style: .semiBold,
              color: colorStringToType(pokemonDetail.types.first.name),
            ),
          ),

          8.0.imVerticalSpace(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 103,
                child: PokemonDetailBodyInfo(
                  value: pokemonDetail.weight.toString(),
                  icon: AppAssets.icons.icWeight,
                  title: "Weight",
                ),
              ),

              SizedBox(
                width: 1,
                height: 48,
                child: Container(color: ColorUtils.grayscaleLight),
              ),

              SizedBox(
                width: 103,
                child: PokemonDetailBodyInfo(
                  value: pokemonDetail.height.toString(),
                  icon: AppAssets.icons.icHeight,
                  title: "Height",
                ),
              ),

              SizedBox(
                width: 1,
                height: 48,
                child: Container(color: ColorUtils.grayscaleLight),
              ),

              SizedBox(
                width: 103,
                child: PokemonDetailAbilityInfo(
                  value: pokemonDetail.abilities,
                  title: "Moves",
                ),
              ),
            ],
          ),

          8.0.imVerticalSpace(),

          Align(
            alignment: .centerLeft,
            child: Text(
              pokemonDetail.description,
              style: TextStyleHelper.apply(
                size: .micro,
                style: .regular,
                color: AppColors.dark,
              ),
            ),
          ),

          16.0.imVerticalSpace(),

          Text(
            "Base Stats",
            style: TextStyleHelper.apply(
              size: .body1,
              style: .semiBold,
              color: colorStringToType(pokemonDetail.types.first.name),
            ),
          ),

          8.0.imVerticalSpace(),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pokemonDetail.stats.map((stat) {
              return PokemonDetailStatInfo(
                title: stat.name,
                stat: stat.baseStat,
                color: colorStringToType(pokemonDetail.types.first.name),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
