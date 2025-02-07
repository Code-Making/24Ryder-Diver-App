import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/constants.dart';
import 'package:rideapp/ui/pages/widgets/textstyles.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final String? prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validators;
  final void Function(String)? onChanged;
  final bool showIcon;
  final bool autoValidate;
  final bool isNum;
  final int? maxLength;
  final bool? enabled;
  final TextCapitalization textCapitalization;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? textFormatters;
  final bool makeHintBold;
  final Widget? prefix;
  final void Function()? onTap;
  final bool readOnly;
  final bool hideUnderlineBorder;
  final double? letterSpacing;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final bool autofocus;
  final bool isEmail;
  final String? value;
  final Color? backgroundColor;
  final int? maxLines;
  const CustomInputField(
      {super.key,
      this.isPassword = false,
      this.hintText = '',
      this.controller,
      this.validators,
      this.onChanged,
      this.prefixIcon,
      this.backgroundColor,
      this.isNum = false,
      this.showIcon = true,
      this.autoValidate = false,
      this.textCapitalization = TextCapitalization.none,
      this.maxLength,
      this.onFieldSubmitted,
      this.suffixIcon,
      this.textFormatters,
      this.makeHintBold = false,
      this.onTap,
      this.prefix,
      this.readOnly = false,
      this.enabled = true,
      this.hideUnderlineBorder = false,
      this.contentPadding,
      this.borderColor,
      this.autofocus = false,
      this.isEmail = false,
      this.value,
      this.maxLines,
      this.letterSpacing});
  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      widget.controller?.text = widget.value!;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(Constants.appSettings.token = "abcd");
    if (widget.textFormatters != null) {
      widget.textFormatters?.add(
          FilteringTextInputFormatter.deny(RegExp(Values().restricEmojiRegex)));
      if (!widget.isPassword) {
        widget.textFormatters?.add(FilteringTextInputFormatter.deny(
          RegExp(r'^\s+'),
        ));
      }
    }
    return SizedBox(
      child: TextFormField(
        textCapitalization: widget.textCapitalization,
        autocorrect: false,
        autofocus: widget.autofocus,
        readOnly: widget.readOnly,
        enableSuggestions: false,
        enabled: widget.enabled ?? true,
        textAlignVertical: TextAlignVertical.center,
        maxLength: widget.maxLength,
        maxLines: widget.isPassword ? 1 : widget.maxLines,
        keyboardType: widget.isNum
            ? const TextInputType.numberWithOptions(signed: true)
            : widget.isEmail
                ? TextInputType.emailAddress
                : null,
        autovalidateMode: widget.autoValidate
            ? AutovalidateMode.always
            : AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        validator: widget.validators,
        obscureText: widget.isPassword ? !passwordVisible : false,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        style: AppTextStyles.normal
            .copyWith(color: Colors.black, letterSpacing: widget.letterSpacing),
        inputFormatters: (widget.textFormatters != null)
            ? widget.textFormatters
            : [
                FilteringTextInputFormatter.deny(
                    RegExp(Values().restricEmojiRegex)),
                if (!widget.isPassword)
                  FilteringTextInputFormatter.deny(RegExp(r'^\s+')),
              ],
        onTap: widget.onTap,
        decoration: InputDecoration(
            fillColor: widget.backgroundColor,
            filled: widget.backgroundColor != null ? true : false,
            isDense: false,
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            hintText: widget.hintText,
            counterText: "",
            // prefix: widget.prefix,
            errorStyle:
                TextStyle(fontSize: 10.spMin, color: Colors.red.shade800),
            errorMaxLines: 2,
            hintStyle: !widget.makeHintBold
                ? AppTextStyles.normal.copyWith(
                    color: "#A0A0A0".toHex(),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  )
                : AppTextStyles.normal.copyWith(color: Colors.black),
            // prefixIconConstraints: BoxConstraints(
            //     minWidth: 0, maxHeight: Platform.isIOS ? 24.r : 18.r),
            suffixIconConstraints: BoxConstraints(minWidth: 0, maxHeight: 18.r),
            prefixIcon: widget.prefix ??
                (widget.enabled == false && widget.prefixIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 4.r),
                        child: Image.asset(
                          widget.prefixIcon!,
                          width: 17.r,
                          height: 17.r,
                          fit: BoxFit.contain,
                        ),
                      )
                    : widget.prefixIcon != null
                        ? Padding(
                            padding: EdgeInsets.only(right: 4.r),
                            child: Image.asset(
                              widget.prefixIcon!,
                              width: 17.r,
                              height: 17.r,
                              fit: BoxFit.contain,
                            ),
                          )
                        : null),
            suffixIcon: widget.suffixIcon,
            // suffix: widget.isPassword
            //     ? InkWell(
            //         onTap: () {
            //           setState(() {
            //             passwordVisible = !passwordVisible;
            //           });
            //         },
            //         child: Icon(
            //           passwordVisible ? Icons.visibility : Icons.visibility_off,
            //           size: 20.r,
            //           color: const Color.fromRGBO(0, 0, 0, 0.4),
            //         ),
            //       )
            //     : widget.suffixIcon,
            errorBorder: OutlineInputBorder(
                borderSide: widget.hideUnderlineBorder
                    ? BorderSide.none
                    : BorderSide(color: Colors.red.shade800)),
            disabledBorder: OutlineInputBorder(
                borderSide: widget.hideUnderlineBorder
                    ? BorderSide.none
                    : BorderSide(color: Colors.grey.shade400)),
            focusedBorder: OutlineInputBorder(
                borderSide: widget.hideUnderlineBorder
                    ? BorderSide.none
                    : BorderSide(color: Palette.primaryBlue)),
            enabledBorder: OutlineInputBorder(
                borderSide: widget.hideUnderlineBorder
                    ? BorderSide.none
                    : BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(
                borderSide: widget.hideUnderlineBorder
                    ? BorderSide.none
                    : BorderSide(color: Colors.grey.shade400))),
      ),
    );
  }
}
