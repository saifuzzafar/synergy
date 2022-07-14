import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:simplify_synergy_2/base/base_widget.dart';
import 'package:simplify_synergy_2/di/app/app_modules.dart';
import 'package:simplify_synergy_2/main/app_viewmodel.dart';
import 'package:simplify_synergy_2/main/navigation/app_router.dart';
import 'package:simplify_synergy_2/main/navigation/route_paths.dart';

class App extends ConsumerWidget {
  late AppViewModel _appViewModel;

  @override
  Widget build(BuildContext context, watch) {
    return BaseWidget<AppViewModel>(
      providerBase: appViewModel,
      onModelReady: (model) {
        _appViewModel = watch(appViewModel);
      },
      builder: (context, appModel, child) {
        return MaterialApp(
            navigatorKey: appLevelKey,
            builder: (context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget!),
              maxWidth: 1400,
              minWidth: 411,
              defaultScale: true,
              breakpoints: const [

              ],
            ),
            // localizationsDelegates: [
            //   S.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate
            // ],
            // supportedLocales: S.delegate.supportedLocales,
            onGenerateTitle: (context) => "Synergy",
            debugShowCheckedModeBanner: false,
            initialRoute: RoutePaths.splash,
            theme: _appViewModel.themeData,
            onGenerateRoute: AppRouter.generateRoute);
      },
    );
  }
}
