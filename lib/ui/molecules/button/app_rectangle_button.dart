
import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/ui/molecules/textview/app_textview.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';
import 'package:simplify_synergy_2/utils/constant/font_type_enum.dart';

class AppRectangleButton extends StatelessWidget {
  final bool isLoading;
  final String label;
  final Function onTap;
  final Color backgroundColor;
  final Color textColor;
  final FontType fontType;
  final double textSize;

  AppRectangleButton({
    this.isLoading: false,
    required this.label,
    required this.onTap,
    this.fontType = FontType.montserratMedium,
    this.textSize = 18,
    this.textColor = AppColor.white,
    this.backgroundColor = AppColor.white,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        width: double.infinity,
        height: 42,
        child: ElevatedButton(
          onPressed: () => onTap.call(),
          child: isLoading
              ? CircularProgressIndicator()
              : AppText(
                  label: label,
                  color: textColor,
                  size: textSize,
                  weight: 5,
                  fontType: fontType,
                ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              foregroundColor: MaterialStateProperty.all(AppColor.dark_gray),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ))),
        ));
  }
}
