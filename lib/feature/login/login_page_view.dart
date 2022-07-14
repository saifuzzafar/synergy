import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simplify_synergy_2/base/base_page.dart';
import 'package:simplify_synergy_2/main/navigation/route_paths.dart';
import 'package:simplify_synergy_2/ui/molecules/app_header_section.dart';
import 'package:simplify_synergy_2/ui/molecules/button/app_button.dart';
import 'package:simplify_synergy_2/ui/molecules/footer_section.dart';
import 'package:simplify_synergy_2/ui/molecules/textfield/app_textfield.dart';
import 'package:simplify_synergy_2/ui/molecules/textview/app_textview.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';
import 'package:simplify_synergy_2/utils/constant/font_type_enum.dart';
import 'package:simplify_synergy_2/utils/constant/image_url.dart';
import 'package:simplify_synergy_2/utils/ui_manager/screen_dimensions.dart';
import 'package:simplify_synergy_2/utils/ui_manager/synergy_ui_manager.dart';

import 'login_page_model.dart';

class LoginPageView extends BasePageViewWidget<LoginViewModel> {
  LoginPageView(ProviderBase model) : super(model);

  @override
  Widget build(BuildContext context, model) {
    final uiManger = SynergyUIManager(context);
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
            const AppHeaderSection(
              isLogin: true,
            ),
            SizedBox(
              height: uiManger.height(context, 105),
            ),
            _buildLoginView(uiManger, context, model),
            SizedBox(
              height: uiManger.height(context, 130),
            ),
            //_buildFooter(uiManger, context, model),
            const AppFooterSection(),

            // Container(height: 698,width: 698,color: Colors.grey,)
          ],
        ),
      ),
    );
  }

  _buildLoginView(
      SynergyUIManager uiManger, BuildContext context, LoginViewModel model) {
    final screenDimension = MediaQuery.of(context).size;
    return Container(
      height: uiManger.height(context, 1300),
      width: uiManger.width(context, 698),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Form(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: uiManger.height(context, 79),
              ),
              AppText(
                label: "Login Account",
                color: Colors.black,
                size: 8,
                weight: 8,
              ),
              SizedBox(
                height: uiManger.height(context, 6.4),
              ),
              AppText(
                label: "Login account to enjoy all the services.",
                color: Colors.grey,
                size: 4,
              ),
              SizedBox(
                height: uiManger.height(context, 80),
              ),
              AppTextField(
                controller: model.userEmailController,
                hintText: "Enter email",
                height: 0,
                labelText: "Email",
                prefixIcon: Image.asset(
                  ImageUrl.message,
                  height: 5,
                  width: 5,
                ),
              ),
              SizedBox(
                height: uiManger.height(context, 30),
              ),
              AppTextField(
                controller: model.userPasswordController,
                hintText: "Enter password",
                height: 40,
                labelText: "Password",
                prefixIcon: Image.asset(
                  ImageUrl.lock,
                  height: 5,
                  width: 5,
                ),
              ),
              SizedBox(
                height: uiManger.height(context, 20),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: uiManger.width(context, 493)),
                  child: AppText(
                    label: "Forgot password?",
                    size: 4,
                    color: AppColor.appYellowColor,
                  ),
                ),
              ),
              SizedBox(
                height: uiManger.height(context, 45),
              ),
              AppButton(
                buttonWidth: uiManger.width(context, 575),
                buttonHeight: uiManger.height(context, 100),
                buttonBorderRadius: 2,
                buttonBackGroundColor: AppColor.appYellowColor,
                text: 'Login',
                onButtonTap: () {
                  _logOutPopUp(context);
                },
              ),
              SizedBox(
                height: uiManger.height(context, 80),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: uiManger.width(context, 140),
                    right: uiManger.width(context, 140)),
                child: RichText(textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "By continuing you agree to our",
                        style: DefaultTextStyle
                            .of(context)
                            .style
                            .copyWith(
                          color: AppColor.black,
                          fontSize: 4,
                          fontFamily: "Poppins",
                        )),
                    TextSpan(
                        text: " Terms & Conditions",
                        style: DefaultTextStyle
                            .of(context)
                            .style
                            .copyWith(
                          color: AppColor.appYellowColor,
                          fontSize: 4,
                          fontFamily: "Poppins",
                        )),
                    TextSpan(
                        text: " and",
                        style: DefaultTextStyle
                            .of(context)
                            .style
                            .copyWith(
                          color: AppColor.black,
                          fontSize: 4,
                          fontFamily: "Poppins",
                        )),
                    TextSpan(
                        text: " Privacy Policy",
                        style: DefaultTextStyle
                            .of(context)
                            .style
                            .copyWith(
                          color: AppColor.appYellowColor,
                          fontSize: 4,
                          fontFamily: "Poppins",
                        )),
                  ]),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildFooter(
      SynergyUIManager uiManger, BuildContext context, LoginViewModel model) {
    final screenDimension = MediaQuery.of(context).size;
    final mainSectionWidth = screenDimension.width * 0.45;
    final discoverSectionWidth = screenDimension.width * 0.15;
    final legalAndSupportSectionWidth = screenDimension.width * 0.20;
    final getInTouchSectionWidth = screenDimension.width * 0.20;

    return Container(
      color: AppColor.headerColor,
      height: uiManger.height(context, 900),
      width: screenDimension.width,
      child: Stack(
        children: [
          Image.asset(
            ImageUrl.footerBackground,
            width: double.infinity,
            height: double.infinity,
          ),
          Row(
            children: [
              Container(
                width: mainSectionWidth,
                padding: EdgeInsets.only(left: uiManger.width(context, 170)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImageUrl.monibagLogo,
                      height: 30,
                      width: 50,
                    ),
                    Container(
                      width: uiManger.width(context, 462),
                      child: AppText(
                        label:
                            "monibag provides remittance, multi-currency and e-wallet services to individuals and businesses across the globe.",
                        color: Colors.white,
                        size: 4,
                        height: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(
                      label: "READ MORE",
                      color: Colors.white,
                      size: 3,
                    ),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    Image.asset(ImageUrl.fbLogo)
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
                      height: uiManger.height(context, 97),
                    ),
                    AppText(
                      label: "Discover",
                      color: AppColor.appYellowColor,
                      size: 4,
                      weight: 3,
                    ),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(label: "Log in", color: Colors.white, size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(label: "Sign up", color: Colors.white, size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(label: "Home", color: Colors.white, size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(
                        label: "How It Works", color: Colors.white, size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(label: "Features", color: Colors.white, size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(label: "Our Mission", color: Colors.white, size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
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
                      height: uiManger.height(context, 97),
                    ),
                    AppText(
                      label: "Legal and Support",
                      color: AppColor.appYellowColor,
                      size: 4,
                      weight: 3,
                    ),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(
                        label: "Terms & Conditions",
                        color: Colors.white,
                        size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(
                        label: "Privacy Policy", color: Colors.white, size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(label: " FAQs", color: Colors.white, size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(
                      label: "Developers",
                      color: AppColor.appYellowColor,
                      size: 4,
                      weight: 3,
                    ),
                    SizedBox(
                      height: uiManger.height(context, 50),
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
                      height: uiManger.height(context, 97),
                    ),
                    AppText(
                      label: "Get in touch",
                      color: AppColor.appYellowColor,
                      size: 4,
                      weight: 3,
                    ),
                    SizedBox(
                      height: uiManger.height(context, 50),
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
                      height: uiManger.height(context, 50),
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
                      height: uiManger.height(context, 50),
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
                      height: uiManger.height(context, 50),
                    ),
                    AppText(
                        label: "United Kingdom", color: Colors.white, size: 3),
                    SizedBox(
                      height: uiManger.height(context, 50),
                    ),
                    AppText(label: " WC2N 4LL", color: Colors.white, size: 3),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _logOutPopUp(BuildContext context) {
    final uiManager = SynergyUIManager(context);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: EdgeInsets.only(
                      top: uiManager.height(context, 190),
                      bottom: uiManager.height(context, 116)),
                  child: Image.asset(
                    ImageUrl.unauthorizedAccess,
                    height: 40,
                    width: 40,
                  ),
                ),
                SizedBox(
                  height: uiManager.height(context, 80),
                ),
                AppText(
                  label: "Unauthorized to use developer portal",
                  color: Colors.black,
                  size: 6,
                  weight: 9,
                ),
                SizedBox(
                  height: 10,
                ),
                AppButton(
                  buttonWidth: uiManager.width(context, 575),
                  buttonHeight: uiManager.height(context, 100),
                  buttonBorderRadius: 2,
                  buttonBackGroundColor: AppColor.appYellowColor,
                  text: 'Contact Us',
                  onButtonTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
