import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'splash_state.dart';

class SplashController extends StateNotifier<SplashState> {
 
  SplashController(): super(SplashState());
}

final splashController =
    StateNotifierProvider<SplashController, SplashState>(
        (ref) {
  return SplashController();
});