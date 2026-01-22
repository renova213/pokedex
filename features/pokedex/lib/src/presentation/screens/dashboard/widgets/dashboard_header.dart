import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      color: AppColors.primaryRed,
      child: Image.asset(
        AppAssets.images.pokedexHeader,
        package: AppAssets.pkg,
        height: 32,
        width: context.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
