import 'dart:async';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:config/config.dart';
import 'di/app_repositories.dart';
import 'routes/app_router.dart';

class PokedexApp extends StatefulWidget {
  const PokedexApp({super.key});

  @override
  State<PokedexApp> createState() => _PokedexAppState();
}

class _PokedexAppState extends State<PokedexApp> {
  Timer? _holdTimer;
  static const _holdDuration = Duration(seconds: 2);

  void _startHold() {
    _holdTimer?.cancel();
    _holdTimer = Timer(_holdDuration, _onHoldTriggered);
  }

  void _cancelHold() {
    _holdTimer?.cancel();
  }

  void _onHoldTriggered() {
    ChuckerFlutter.showChuckerScreen();
  }

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.deferToChild,
      onPointerDown: (_) => _startHold(),
      onPointerUp: (_) => _cancelHold(),
      onPointerCancel: (_) => _cancelHold(),
      child: MultiRepositoryProvider(
        providers: appRepositories,
        child: MultiBlocProvider(
          providers: appCubits,
          child: MaterialApp.router(
            theme: AppTheme.lightTheme.copyWith(
              scaffoldBackgroundColor: AppColors.primaryRed,
              appBarTheme: const AppBarTheme(
                surfaceTintColor: Colors.transparent,
                elevation: 0,
              ),
            ),
            darkTheme: AppTheme.darkTheme.copyWith(
              scaffoldBackgroundColor: AppColors.primaryRed,
              appBarTheme: const AppBarTheme(
                surfaceTintColor: Colors.transparent,
                elevation: 0,
              ),
            ),
            routerConfig: appRouter,
            builder: (context, child) {
              return Scaffold(
                body: GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: child ?? const SizedBox.shrink(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
