import 'package:dependencies/dependencies.dart';
import 'package:pokedex_app/src/splash/view_model/app_splash_state.dart';

class AppSplashCubit extends Cubit<AppSplashState> {
  AppSplashCubit() : super(AppSplashState.initial());

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isReady: true));
  }
}
