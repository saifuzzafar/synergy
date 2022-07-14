import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simplify_synergy_2/utils/color_utils.dart';
import 'package:simplify_synergy_2/utils/ui_manager/synergy_ui_manager.dart';

class AppTextField extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Function()? onPressed;
  final TextEditingController? controller;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final String? labelText;
  final String hintText;
  final EdgeInsets? contentPadding;
  final String? initialValue;
  final bool? autoFocus;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final Function(String)? onFieldSubmitted;
  final bool? readOnly;
  final int? maxLength;
  final bool? obscureText;
  final String obscuringCharacter;
  final Widget? suffixIcon;
  // final Widget Function(bool enabled, String value)? suffixIcon;
  final Widget? prefixIcon;
  final Key? key;
  final Widget Function()? prefix;
  final bool enabled;
  final int? maxLines;
  final int minLines;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool busy;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool filled;
  final Color filledColor;
  final double fontSize;
  final double labelFontSize;
  final Function(bool hasFocus, bool isValid, String value)? textHintWidget;
  final EdgeInsets dividerPadding;
  final Function? labelIcon;

  AppTextField(
      {this.height,
      this.width,
      this.child,
      this.onPressed,
      this.controller,
      this.inputAction: TextInputAction.next,
      this.inputType,
      this.labelText,
      required this.hintText,
      this.contentPadding,
      this.initialValue,
      this.autoFocus: false,
      this.validator,
      this.onSaved,
      this.readOnly: false,
      this.maxLength,
      this.key,
      this.obscureText = false,
      this.obscuringCharacter: '•',
      this.suffixIcon,
      this.prefixIcon,
      this.prefix,
      this.enabled: true,
      this.inputFormatters,
      this.busy: false,
      this.maxLines: 1,
      this.minLines: 1,
      this.onChanged,
      this.filled: false,
      this.fontSize: 4,
      this.labelFontSize: 4,
      this.filledColor: AppColor.white,
      this.onFieldSubmitted,
      this.labelIcon,
      this.dividerPadding:
          const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      this.floatingLabelBehavior: FloatingLabelBehavior.never,
      this.textAlign: TextAlign.start,
      this.textHintWidget})
      : super(key: key);

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  // late bool _secureText;
  FocusNode _focusNode = FocusNode();
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    // _secureText = widget.obscureText!;
    _focusNode.addListener(_onFocusChange);
  }

  // bool get secureText => _secureText;

  // set secureText(bool value) {
  //   setState(() {
  //     _secureText = value;
  //   });
  // }

  // bool get isValid => _isValid;

  // set isValid(bool value) {
  //   setState(() {
  //     _isValid = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final uiManager = SynergyUIManager(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: uiManager.width(context, 575),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: widget.labelText,
                      style: DefaultTextStyle
                          .of(context)
                          .style
                          .copyWith(
                        color: AppColor.black,
                        fontSize: 4,
                         fontFamily: "Poppins",
                      )),
                  WidgetSpan(
                      child: widget.labelIcon?.call() ?? Container())
                ]),
              ),
            ),
            SizedBox(height: uiManager.height(context, 7),),
            Container(
              width: uiManager.width(context, 575),
              height: uiManager.height(context, 120),
              decoration: const BoxDecoration(
                  color: AppColor.textFieldColor,
                  borderRadius: BorderRadius.all(Radius.circular(1.0))),
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Center(
                  child: TextFormField(
                    focusNode: _focusNode,
                    maxLength: widget.maxLength,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 4, backgroundColor: AppColor.textFieldColor,fontFamily: "Poppins",
                      //fontWeight: FontWeight.w600,
                    ),
                    initialValue: widget.initialValue,
                    autofocus: widget.autoFocus!,
                    textInputAction: widget.inputAction,
                    keyboardType: widget.inputType,
                    inputFormatters: widget.inputFormatters,
                    readOnly: widget.readOnly ?? false,
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    obscureText: widget.obscureText!,
                    obscuringCharacter: widget.obscuringCharacter,
                    decoration: InputDecoration(
                        prefix: widget.prefix?.call(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: widget.prefixIcon,
                        ),
                        prefixIconConstraints:
                        const BoxConstraints(maxWidth: 10),
                        // labelText: widget.labelText,
                        // labelStyle: TextStyle(
                        //   fontSize: widget.labelFontSize,
                        //   color: AppColor.black,
                        //   fontWeight: FontWeight.w400,
                        //   fontStyle: FontStyle.normal,
                        // ),
                        // contentPadding: EdgeInsets.only(top: 8),
                        hintText: widget.hintText,
                        contentPadding: const EdgeInsets.only(top:3),
                        hintMaxLines: 1,
                        counterText: "",
                        alignLabelWithHint: true,
                        isDense: true,
                        filled: widget.filled,
                        fillColor: widget.filledColor,
                        hintStyle: TextStyle(
                          color: AppColor.dark_gray, fontSize: 4,
                          //fontSize: widget.fontSize,
                          fontWeight: FontWeight.normal,
                        ),
                        suffixIcon: widget.suffixIcon,
                        // ?.call(isValid, widget.controller!.text),
                        // suffixIconConstraints:
                        //     BoxConstraints.loose(Size(48, 50)),
                        enabled: widget.enabled,
                        floatingLabelBehavior: widget.floatingLabelBehavior),
                    controller: widget.controller,
                    validator: this.widget.validator,
                    onSaved: this.widget.onSaved,
                    onFieldSubmitted: this.widget.onFieldSubmitted,
                    onChanged: (value) {
                      setState(() {});
                      widget.onChanged?.call(value);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        // widget.textHintWidget?.call(
        //         _focusNode.hasFocus, isValid, widget.controller!.text) ??
        //     Container(),
      ],
    );
  }

  void _onFocusChange() {
    // setState(() {
    //   isValid = true;
    // });
  }

// @override
// void dispose() {
//   _focusNode.removeListener(_onFocusC
}