
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simplify_synergy_2/base/base_page.dart';
import 'package:simplify_synergy_2/di/home/home_modules.dart';
import 'package:simplify_synergy_2/feature/home/home_page_view.dart';

import 'home_page_model.dart';

class HomePage extends BasePage<HomeViewModel> {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseStatefulPage<HomeViewModel, HomePage> {
  @override
  ProviderBase provideBase() {
    return HomeViewModelProvider;
  }

  @override
  void onModelReady(HomeViewModel model) async {
  }

  @override
  Widget buildView(BuildContext context, HomeViewModel model) {
    return HomePageView(provideBase());
  }
}
