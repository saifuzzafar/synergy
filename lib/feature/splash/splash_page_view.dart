import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simplify_synergy_2/base/base_page.dart';
import 'package:simplify_synergy_2/feature/splash/splash_page_model.dart';
import 'package:simplify_synergy_2/main/navigation/route_paths.dart';
import 'package:simplify_synergy_2/ui/molecules/stream_builder/app_stream_builder.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';

class SplashPageView extends BasePageViewWidget<SplashViewModel> {
  SplashPageView(ProviderBase model) : super(model);

  @override
  Widget build(BuildContext context, model) {
    return AppStreamBuilder<double>(
      stream: model.splashProgressStream,
      initialData: 0,
      onData: (data) {
        if (data == 1) {
          Navigator.pushReplacementNamed(context, RoutePaths.login);
        }
      },
      dataBuilder: (context, data) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: AppColor.very_dark_blue,
          alignment: Alignment.center,
        );
      },
    );
  }
}
