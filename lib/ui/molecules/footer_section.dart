import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/ui/molecules/dash_separator.dart';
import 'package:simplify_synergy_2/ui/molecules/textview/app_textview.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';
import 'package:simplify_synergy_2/utils/constant/image_url.dart';
import 'package:simplify_synergy_2/utils/ui_manager/synergy_ui_manager.dart';

class AppFooterSection extends StatelessWidget {
  const AppFooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildFooterSection(context);
  }



  _buildFooterSection(BuildContext context) {
    final screenDimension = MediaQuery.of(context).size;
    final uiManager = SynergyUIManager(context);
    return Container(
      color: AppColor.headerColor,
      height: uiManager.height(context, 1180),
      width: screenDimension.width,
      child: Stack(
        children: [
          Image.asset(
            ImageUrl.footerBackground,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              _buildDetailsSection(context),
              Padding(
                padding:  EdgeInsets.only(bottom:uiManager.height(context, 30) ,top:uiManager.height(context, 20) ,left: uiManager.width(context, 170),right:uiManager.width(context, 170) ),
                child: const DashSeparator(color: Colors.grey),
              ),
              _buildCopyRightSection(context)
            ],
          ),

        ],
      ),
    );
  }

  _buildDetailsSection(BuildContext context){
    final screenDimension = MediaQuery.of(context).size;
    final mainSectionWidth = screenDimension.width * 0.45;
    final discoverSectionWidth = screenDimension.width * 0.15;
    final legalAndSupportSectionWidth = screenDimension.width * 0.20;
    final getInTouchSectionWidth = screenDimension.width * 0.20;
    final uiManager = SynergyUIManager(context);
    return Row(
        children: [
          Container(
            width: mainSectionWidth,
            padding: EdgeInsets.only(left: uiManager.width(context, 170)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImageUrl.monibagLogo,
                  height: 30,
                  width: 50,
                ),
                Container(
                  width: uiManager.width(context, 462),
                  child: AppText(
                    label:
                    "monibag provides remittance, multi-currency and e-wallet services to individuals and businesses across the globe.",
                    color: Colors.white,
                    size: 4,
                    height: 2.0,
                  ),
                ),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(
                  label: "READ MORE",
                  color: Colors.white,
                  size: 3,
                ),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                Image.asset(ImageUrl.fbLogo,height: 5,width: 5,)
              ],
            ),

            //
          ),
          Container(
            width: discoverSectionWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: uiManager.height(context, 245),
                ),
                AppText(
                  label: "Discover",
                  color: AppColor.appYellowColor,
                  size: 4,
                  weight: 3,
                ),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(label: "Log in", color: Colors.white, size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(label: "Sign up", color: Colors.white, size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(label: "Home", color: Colors.white, size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(
                    label: "How It Works", color: Colors.white, size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(label: "Features", color: Colors.white, size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(label: "Our Mission", color: Colors.white, size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(
                    label: "Get in Touch", color: Colors.white, size: 3),
              ],
            ),
          ),
          Container(
            width: legalAndSupportSectionWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: uiManager.height(context, 97),
                ),
                AppText(
                  label: "Legal and Support",
                  color: AppColor.appYellowColor,
                  size: 4,
                  weight: 3,
                ),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(
                    label: "Terms & Conditions",
                    color: Colors.white,
                    size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(
                    label: "Privacy Policy", color: Colors.white, size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(label: " FAQs", color: Colors.white, size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(
                  label: "Developers",
                  color: AppColor.appYellowColor,
                  size: 4,
                  weight: 3,
                ),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(
                    label: "Developer Portal",
                    color: Colors.white,
                    size: 3),
              ],
            ),
          ),
          Container(
            width: getInTouchSectionWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: uiManager.height(context, 97),
                ),
                AppText(
                  label: "Get in touch",
                  color: AppColor.appYellowColor,
                  size: 4,
                  weight: 3,
                ),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageUrl.mailYellow,
                      height: 5,
                      width: 5,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    AppText(
                        label: "support@monibag.com",
                        color: Colors.white,
                        size: 3),
                  ],
                ),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageUrl.phone,
                      height: 5,
                      width: 5,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    AppText(
                        label: "+(44) 208 3802 3899",
                        color: Colors.white,
                        size: 3),
                  ],
                ),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageUrl.location,
                      height: 5,
                      width: 5,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    AppText(
                        label: "5 Goodwin’s Court, London",
                        color: Colors.white,
                        size: 3),
                  ],
                ),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(
                    label: "United Kingdom", color: Colors.white, size: 3),
                SizedBox(
                  height: uiManager.height(context, 50),
                ),
                AppText(label: " WC2N 4LL", color: Colors.white, size: 3),
              ],
            ),
          )
        ],
      );
  }

  _buildCopyRightSection(BuildContext context) {
    final uiManager = SynergyUIManager(context);
    final screenDimension = MediaQuery.of(context).size;
    return Container(
      width: screenDimension.width,
      padding: EdgeInsets.only(left: uiManager.width(context, 170)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,children: [
            Image.asset(ImageUrl.appStoreLogo,height: uiManager.height(context, 60),),
            SizedBox(width: 10,),
            Image.asset(ImageUrl.googlePlayLogo,height: uiManager.height(context, 60)),
          ],),
          
          Padding(
            padding:  EdgeInsets.only(right: uiManager.width(context, 170),),
            child: AppText(label: "Copyright © monibag.com All rights reserved.",size: 4,),
          ),
        ],
      ),
    );
  }
}
