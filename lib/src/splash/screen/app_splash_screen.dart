import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_app/src/splash/view_model/app_splash_cubit.dart';
import 'package:pokedex_app/src/splash/view_model/app_splash_state.dart';
import 'package:shared_components/shared_components.dart';

class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({super.key});

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AppSplashCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppSplashCubit, AppSplashState>(
      listenWhen: (prev, curr) => prev.isReady != curr.isReady,
      listener: (context, state) {
        if (state.isReady) {
          // nanti bisa navigate ke screen yang ditentukan yaks
          context.pushReplacement(PokedexRoutes.pokedex);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: context.height * 0.4,
              left: context.width * 0.2,
              child: Image.asset(
                AppAssets.images.pokedexHeader,
                package: AppAssets.pkg,
                fit: BoxFit.cover,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
