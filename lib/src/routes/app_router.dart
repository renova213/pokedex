import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_app/src/routes/app_route.dart';
import 'package:pokedex_app/src/splash/screen/app_splash_screen.dart';
import 'package:pokedex_app/src/splash/view_model/app_splash_cubit.dart';

final GoRouter appRouter = GoRouter(
  observers: kDebugMode ? [ChuckerFlutter.navigatorObserver] : [],
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(path: '/', redirect: (_, _) => '/splash'),
    GoRoute(
      path: '/splash',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => AppSplashCubit()..init(),
          child: AppSplashScreen(),
        );
      },
    ),
    ...pokedexRouter,
  ],
);
