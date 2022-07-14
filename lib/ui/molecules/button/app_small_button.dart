
import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';
import 'package:simplify_synergy_2/utils/constant/font_type_enum.dart';

import '../textview/app_textview.dart';

class AppSmallButton extends StatelessWidget {
  final String label;
  final double height;
  final void Function()? onPressed;
  const AppSmallButton(
      {required this.label, required this.height, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColor.very_light_gray),
              foregroundColor: MaterialStateProperty.all<Color>(AppColor.black),
              textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat-ExtraBold',
                // fontWeight: FontWeight.bold,
              )),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                // side: BorderSide(color: Colors.red)
              ))),
          onPressed: onPressed,
          child: AppText(
            label: label,
            fontType: FontType.montserratBold,
            color: AppColor.appYellowColor,
          )),
    );
  }
}
