
import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/base/base_page_view_model.dart';

class LoginViewModel extends BasePageViewModel {

  TextEditingController userEmailController =
  TextEditingController();
  TextEditingController userPasswordController =
  TextEditingController();


  @override
  void dispose() {

    super.dispose();
  }
}
