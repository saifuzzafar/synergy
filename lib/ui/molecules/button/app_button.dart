
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';

class AppButton extends StatelessWidget {
  final bool isLoading;
  final TextStyle? textStyle;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonBorderRadius;
  final Color buttonBackGroundColor;
  final String text;
  final Function? onButtonTap;

  AppButton(
      {this.isLoading: false,
      this.textStyle,required this.buttonWidth,
      required this.buttonHeight,
      required this.buttonBorderRadius,
      required this.buttonBackGroundColor,
      required this.text,
      this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        child: Text(
          text,
          style: buttonStyle(),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(buttonBackGroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonBorderRadius),
              // side: BorderSide(color: Colors.red)
            ))),



        onPressed: () {
          onButtonTap!.call();
        },
      ),
    );
  }
}

TextStyle buttonStyle() {
  return TextStyle(
      fontSize: 4,
      color: AppColor.white,
      fontWeight: FontWeight.bold);
}
