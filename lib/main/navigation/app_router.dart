import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/feature/home/home_page.dart';
import 'package:simplify_synergy_2/feature/login/login_page.dart';
import 'package:simplify_synergy_2/feature/splash/splash_page.dart';
import 'package:simplify_synergy_2/main/navigation/route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(
            builder: (context) => SplashPage(),
            settings: const RouteSettings(name: RoutePaths.splash));

      case RoutePaths.login:
        return CupertinoPageRoute(
            builder: (context) => LoginPage(),
            settings: const RouteSettings(name: RoutePaths.login));
        case RoutePaths.home:
        return CupertinoPageRoute(
            builder: (context) => HomePage(),
            settings: const RouteSettings(name: RoutePaths.home));

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
