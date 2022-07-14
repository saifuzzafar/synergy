import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/main/navigation/route_paths.dart';
import 'package:simplify_synergy_2/ui/molecules/textview/app_textview.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';
import 'package:simplify_synergy_2/utils/constant/image_url.dart';
import 'package:simplify_synergy_2/utils/ui_manager/synergy_ui_manager.dart';

class AppHeaderSection extends StatelessWidget {
  final bool isLogin;

  const AppHeaderSection({this.isLogin = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildHeader(context);
  }

  _buildHeader(BuildContext context) {
    final uiManager = SynergyUIManager(context);
    return Column(
      children: [
        Container(
          height: uiManager.height(
            context,
            145,
          ),
          width: uiManager.width(
            context,
            1682,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                ImageUrl.appLogoBlack,
                height: 15,
                width: 20,
              ),
              isLogin
                  ? InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutePaths.home);
                },
                    child: Image.asset(
                        ImageUrl.home,
                        height: 13,
                        width: 20,
                      ),
                  )
                  :
              Stack(
                children: [
                   AppText(
                    label: "Logout",
                    size: 4,
                    color: AppColor.appYellowColor,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 15,
                      height: 8,
                      color: Colors.transparent,

                    ),
                  ),
                ],

              ),


            ],
          ),
        ),
        Container(
          height: uiManager.height(
            context,
            145,
          ),
          width: uiManager.width(
            context,
            1682,
          ),
          color: AppColor.headerColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(ImageUrl.leftHeaderImage),
              Image.asset(ImageUrl.rightHeaderImage)
            ],
          ),
        ),
      ],
    );
  }
}
