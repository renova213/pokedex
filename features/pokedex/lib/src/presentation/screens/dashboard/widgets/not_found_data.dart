import 'package:config/config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class NotFoundData extends StatelessWidget {
  const NotFoundData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, bottom: 4, right: 4, top: 24),
      width: context.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            width: 200,
            height: 200,
            AppAssets.lotties.emptyData,
            package: AppAssets.pkg,
          ),
          Text(
            "No Pokemon Found",
            style: TextStyleHelper.apply(size: .body2, style: .semiBold),
          ),
        ],
      ),
    );
  }
}
