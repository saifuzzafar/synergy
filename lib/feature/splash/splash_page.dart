import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simplify_synergy_2/base/base_page.dart';
import 'package:simplify_synergy_2/di/splash/splash_modules.dart';
import 'package:simplify_synergy_2/feature/splash/splash_page_model.dart';
import 'package:simplify_synergy_2/feature/splash/splash_page_view.dart';

class SplashPage extends BasePage<SplashViewModel> {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends BaseStatefulPage<SplashViewModel, SplashPage> {
  @override
  ProviderBase provideBase() {
    return splashViewModelProvider;
  }

  @override
  void onModelReady(SplashViewModel model) {
    model.startTimer();
  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  Widget buildView(BuildContext context, SplashViewModel model) {
    return SplashPageView(provideBase());
  }
}
