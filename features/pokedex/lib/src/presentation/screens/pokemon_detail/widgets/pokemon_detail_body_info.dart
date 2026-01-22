import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class PokemonDetailBodyInfo extends StatelessWidget {
  final String value;
  final String icon;
  final String title;

  const PokemonDetailBodyInfo({
    super.key,
    required this.value,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorFiltered(
              colorFilter: ColorFilter.mode(AppColors.dark, BlendMode.srcATop),
              child: Image.asset(
                icon,
                width: 16,
                height: 16,
                package: AppAssets.pkg,
              ),
            ),

            8.0.imHorizontalSpace(),

            Text(
              value,
              style: TextStyleHelper.apply(
                size: .micro,
                style: .regular,
                color: AppColors.dark,
              ),
            ),
          ],
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
