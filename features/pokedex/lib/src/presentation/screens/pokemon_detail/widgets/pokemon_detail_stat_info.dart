import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class PokemonDetailStatInfo extends StatelessWidget {
  final String title;
  final int stat;
  final Color color;

  const PokemonDetailStatInfo({
    super.key,
    required this.title,
    required this.stat,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyleHelper.apply(
                      size: .micro,
                      style: .semiBold,
                      color: AppColors.dark,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  width: 1,
                  height: 16,
                  child: Container(color: AppColors.greyScaleLight),
                ),
              ),

              SizedBox(
                width: 24,
                child: Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Text(
                    "$stat",
                    style: TextStyleHelper.apply(
                      size: .micro,
                      style: .regular,
                      color: AppColors.dark,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          flex: 6,
          child: LinearProgressIndicator(
            value: stat / 100,
            backgroundColor: color.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
