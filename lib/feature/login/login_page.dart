
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simplify_synergy_2/base/base_page.dart';
import 'package:simplify_synergy_2/di/login/login_modules.dart';
import 'login_page_model.dart';
import 'login_page_view.dart';

class LoginPage extends BasePage<LoginViewModel> {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends BaseStatefulPage<LoginViewModel, LoginPage> {
  @override
  ProviderBase provideBase() {
    return loginViewModelProvider;
  }

  @override
  void onModelReady(LoginViewModel model) async {
  }

  @override
  Widget buildView(BuildContext context, LoginViewModel model) {
    return LoginPageView(provideBase());
  }
}
