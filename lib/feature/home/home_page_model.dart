
import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/base/base_page_view_model.dart';
import 'package:simplify_synergy_2/utils/constant/image_url.dart';

class HomeViewModel extends BasePageViewModel {


  var itemTitle = ["Authentication","Admin", "IMTO - Nigeria","Authentication","Admin", "IMTO - Nigeria"];
  var settingApiImageURL = ImageUrl.settingApiLogo;
  var customerCareImageURL = ImageUrl.customerCare;

  @override
  void dispose() {

    super.dispose();
  }
}
