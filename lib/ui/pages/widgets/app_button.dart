import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,this.child,
    this.isRounded = false,
    this.height,
    this.width,
    required this.label,
    this.color,
    this.padding,
    this.textColor,
    this.isOutlined = false,
    this.onPressed,
  }) : super(key: key);
  final Widget? child;
  final bool isOutlined;
  final bool isRounded;
  final String label;
  final onPressed;
  final double? height;
  final double? width;
  final double? padding;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    TextStyle buttonStyle =
        TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w600);

    return isOutlined
        ? SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: "background: #FF0C0C;".toHexColor(),
                side: BorderSide(
                  color: "background: #FF0C0C;".toHexColor(),
                ),
              ),
              onPressed: onPressed,
              child:child?? Text(
                label,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: "background: #FF0C0C;".toHexColor()),
              ),
            ),
          )
        : Container(
            margin: padding == null
                ? null
                : EdgeInsets.symmetric(horizontal: padding!),
            width: width ?? MediaQuery.of(context).size.width,
            height: height ?? 50.h,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    backgroundColor: color ?? Palette.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(isRounded ? 60 : 8))),
                child: Container(
                  alignment: Alignment.center,
                  child:child?? Text(
                    label,
                    style:
                        buttonStyle.copyWith(color: textColor ?? Colors.white),
                  ),
                )),
          );
  }
}
