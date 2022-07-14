import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl_browser.dart';
import 'package:simplify_synergy_2/base/base_page.dart';
import 'package:simplify_synergy_2/ui/molecules/app_header_section.dart';
import 'package:simplify_synergy_2/ui/molecules/footer_section.dart';
import 'package:simplify_synergy_2/ui/molecules/gride_view_item.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';
import 'package:simplify_synergy_2/utils/ui_manager/synergy_ui_manager.dart';

import 'home_page_model.dart';

class HomePageView extends BasePageViewWidget<HomeViewModel> {
  HomePageView(ProviderBase model) : super(model);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    // TODO: implement build
   final uiManager = SynergyUIManager(context);
    final screenDimension = MediaQuery.of(context).size;
    return Container(
      color: AppColor.appBackground,
      height: screenDimension.height,
      width: screenDimension.width,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppHeaderSection(),
            SizedBox(
              height: uiManager.height(context, 105),
            ),
            _buildGridView(uiManager, context,model),
            SizedBox(
              height: uiManager.height(context, 130),
            ),
            const AppFooterSection(),

          ],
        ),
      ),
    );
  }
  _buildGridView(SynergyUIManager uiManager,BuildContext context,HomeViewModel model){
    final itemWidth = uiManager.height(context, 200);
        final itemHeight = uiManager.height(context, 200);
        final itemRation = itemWidth/itemHeight;
        // return GridView.count(crossAxisCount: 3,);

    final crossAxis  = uiManager.width(context, 73);
    final mainAxis  = uiManager.width(context, 78);


   return Container(
     width: uiManager.width(context, 1682),
     // height: uiManager.width(context, 1000),

     child: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: crossAxis,
          mainAxisSpacing:mainAxis,childAspectRatio: itemRation.toDouble(),
        ),padding: const EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 10),
        shrinkWrap: true,
        physics:
       const NeverScrollableScrollPhysics(),
        itemCount: model.itemTitle.length,
        itemBuilder:
            (BuildContext context,
            int index) {
          final title = model.itemTitle[index];
          final imageURL =  model.itemTitle[index] == "Admin" ? model.customerCareImageURL : model.settingApiImageURL;
          return  GridViewItem(title: title ,imageURL: imageURL,);
        },
      ),
   );

  }
}