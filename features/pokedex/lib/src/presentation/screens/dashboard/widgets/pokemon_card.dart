import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class PokemonCard extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final VoidCallback? onTap;

  const PokemonCard({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 12,
              right: 8,
              child: Text(
                "#$id",
                style: TextStyleHelper.apply(
                  size: .caption,
                  style: .regular,
                  color: AppColors.greyScaleMedium,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 44,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(child: const SizedBox.shrink()),
                      Text(
                        name.capitalized,
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.apply(
                          size: .micro,
                          style: .regular,
                          color: AppColors.greyScaleDark,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 72,
              height: 72,
              child: AppNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: Center(
                  child: Image.asset(
                    AppAssets.images.pikachuShadow,
                    package: AppAssets.pkg,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
