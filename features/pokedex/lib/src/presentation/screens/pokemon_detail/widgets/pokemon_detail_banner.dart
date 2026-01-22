import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class PokemonDetailBanner extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final String imageUrl;
  final bool canGoPrev;
  final bool canGoNext;

  const PokemonDetailBanner({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.imageUrl,
    required this.canGoPrev,
    required this.canGoNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        canGoPrev
            ? GestureDetector(
                onTap: onPrevious,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcATop,
                  ),
                  child: Icon(Icons.keyboard_arrow_left, size: 32),
                ),
              )
            : SizedBox.shrink(),

        SizedBox(width: 24),

        AppNetworkImage(
          imageUrl: imageUrl,
          width: 200,
          height: 200,
          placeholder: Center(
            child: Image.asset(
              AppAssets.images.pikachuShadow,
              package: AppAssets.pkg,
            ),
          ),
        ),

        SizedBox(width: 24),

        canGoNext
            ? GestureDetector(
                onTap: onNext,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcATop,
                  ),
                  child: Icon(Icons.keyboard_arrow_right, size: 32),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
