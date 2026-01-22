import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class PokemonDetailHeader extends StatelessWidget {
  final VoidCallback onBack;
  final String title;
  final int number;

  const PokemonDetailHeader({
    super.key,
    required this.onBack,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: onBack,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcATop,
                ),
                child: Icon(Icons.arrow_back, size: 32),
              ),
            ),

            SizedBox(width: 8),

            Text(
              title.capitalized,
              textAlign: TextAlign.left,
              style: TextStyleHelper.apply(
                size: .h2,
                style: .semiBold,
                color: AppColors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Expanded(
              child: Text(
                "#$number",
                textAlign: .right,
                style: TextStyleHelper.apply(
                  size: .body2,
                  style: .regular,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
