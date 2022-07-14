import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:simplify_synergy_2/utils/constant/font_type_enum.dart';

class AppText extends StatelessWidget {
  final String label;
  final FontType fontType;
  final Color? color;
  final bool isUnderlined;
  final bool isStriked;
  final double? size;
  final bool center;
  final bool isBold;
  final TextOverflow overflow;
  final bool multiLine;
  final int? weight;
  final double? height;
  final int? maxLines;
  final bool justify;
  final bool end;
  final Function? onTap;

  AppText({
    required this.label,
    this.fontType = FontType.poppinsRegular,
    this.color,
    this.size,
    this.weight,
    this.overflow = TextOverflow.visible,
    this.isUnderlined = false,
    this.isStriked = false,
    this.center = false,
    this.justify = false,
    this.end = false,
    this.isBold = false,
    this.multiLine = true,
    this.height,
    this.maxLines,this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign(),
      overflow: textOverflow(overflow) ?? TextOverflow.visible,
      maxLines: maxLines,
      softWrap: multiLine,
      text: TextSpan(
          text: label,recognizer: new TapGestureRecognizer()..onTap = () => onTap,
          style: TextStyle(
             fontFamily: "Poppins",
            fontWeight: fontWeight(),
            height: height,
            fontSize: size,
            color: color ?? Colors.white,
            decoration: underline(isUnderlined, isStriked),
          )),
    );
  }

  FontWeight fontWeight() {
    if (weight != null) {
      switch (weight) {
        case 1:
          return FontWeight.w100;
        case 2:
          return FontWeight.w200;
        case 3:
          return FontWeight.w300;
        case 4:
          return FontWeight.w400;
        case 5:
          return FontWeight.w500;
        case 6:
          return FontWeight.w600;
        case 7:
          return FontWeight.w700;
        case 8:
          return FontWeight.w800;
        case 9:
          return FontWeight.w900;
      }
    }
    if (isBold == true) {
      return FontWeight.bold;
    } else {
      return FontWeight.normal;
    }
  }

  double fontsize(double size) {
    return size;
  }

  underline(bool underline, bool isStriked) {
    if (underline == true) {
      return TextDecoration.underline;
    }
    if (isStriked == true) {
      return TextDecoration.lineThrough;
    }
  }

  String fontFamily() {
    switch (fontType) {
      case FontType.montserratBlack:
        return 'Montserrat-Black';

      case FontType.montserratBlackItalic:
        return 'Montserrat-BlackItalic';

      case FontType.montserratBold:
        return 'Montserrat-Bold';

      case FontType.montserratBoldItalic:
        return 'Montserrat-BoldItalic';

      case FontType.montserratExtraBold:
        return 'Montserrat-ExtraBold';

      case FontType.montserratExtraBoldItalic:
        return 'Montserrat-ExtraBoldItalic';

      case FontType.montserratExtraLight:
        return 'Montserrat-ExtraLight';

      case FontType.montserratExtraLightItalic:
        return 'Montserrat-ExtraLightItalic';

      case FontType.montserratItalic:
        return 'Montserrat-Italic';

      case FontType.montserratLight:
        return 'Montserrat-Light';

      case FontType.montserratLightItalic:
        return 'Montserrat-LightItalic';

      case FontType.montserratMedium:
        return 'Montserrat-Medium';

      case FontType.montserratMediumItalic:
        return 'Montserrat-MediumItalic';

      case FontType.montserratRegular:
        return 'Montserrat-Regular';

      case FontType.montserratSemiBold:
        return 'Montserrat-SemiBold';

      case FontType.montserratSemiBoldItalic:
        return 'Montserrat-SemiBoldItalic';

      case FontType.montserratThin:
        return 'Montserrat-Thin';

      case FontType.montserratThinItalic:
        return 'Montserrat-ThinItalic';

      case FontType.poppinsRegular:
        return 'Poppins-Regular';

      default:
        return 'Montserrat-Medium';
    }
  }

  textAlign() {
    if (center) {
      return TextAlign.center;
    }
    if (end) {
      return TextAlign.end;
    }
    if (justify) {
      return TextAlign.justify;
    }
    return TextAlign.left;
  }

  textOverflow(TextOverflow overflow) {
    if (overflow == TextOverflow.ellipsis) {
      return TextOverflow.ellipsis;
    }
    return null;
  }
}
