import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class PokemonDetailAbilityInfo extends StatelessWidget {
  final List<String> value;
  final String title;

  const PokemonDetailAbilityInfo({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: value.map((ability) {
            return Text(
              ability,
              style: TextStyleHelper.apply(
                size: .micro,
                style: .regular,
                color: AppColors.dark,
              ),
            );
          }).toList(),
        ),

        12.0.imVerticalSpace(),

        Text(
          title.capitalized,
          style: TextStyleHelper.apply(
            size: .caption,
            style: .regular,
            color: AppColors.greyScaleMedium,
          ),
        ),
      ],
    );
  }
}
