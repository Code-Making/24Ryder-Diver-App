import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';

extension HexTOColor on String {
  Color toHex() {
    return HexColor.fromHex(this);
  }

  Color toHexColor() {
    return HexColor.fromHex(
        replaceAll('background: ', '').split(' ').last.replaceAll(';', ''));
  }
}

extension StringAddition on num {
  num addNum(num value) {
    num currentValue = (this) ?? 0;
    num result = currentValue + value;
    return result;
  }
}

class sb extends StatelessWidget {
  const sb({
    super.key,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
    );
  }
}

extension SizzedBox on int {
  Widget get toh => toheight();

  /// to sizedbox width
  Widget get toW => toWidth();

  Widget toheight() => sb(height: toDouble());
  Widget toWidth() => sb(width: toDouble());
}

extension WidgetExpanded on Widget {
  Widget get expanded => _expanded();
  // Extends any Widget to wrap it with Expanded
  Widget _expanded() => Expanded(child: this);
  Widget get center => _center();
  Widget _center() => Center(child: this);
  Widget get alignRight => _alignRight();
  Widget _alignRight() => Align(
        alignment: Alignment.topRight,
        child: this,
      );
  Widget get padding20left => Padding(
        padding: const EdgeInsets.only(left: 20),
        child: this,
      );
  Widget get margin20right => Container(
        child: this,
      ).marginOnly(right: 20);
  Widget get margin12right => Container(
        child: this,
      ).marginOnly(right: 12);
  Widget get marginbottom => Container(
        child: this,
      ).marginOnly(bottom: 20);
  Widget get padding20top => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: this,
      );
  margin(double? top) {
    return marginOnly(top: top ?? 20);
  }
}

extension LargeText on String {
  Widget get toLargeText18 => Text(
        this,
        style: Get.textTheme.titleLarge?.copyWith(fontSize: 18),
      );
  Widget get toLargeText18700 => Text(
        this,
        style: Get.textTheme.titleLarge
            ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
      );
  Widget get toLargeText28 => Text(
        this,
        style: Get.textTheme.titleLarge?.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
      );
  Widget get toLargeText16bold => Text(
        this,
        style: Get.textTheme.titleLarge
            ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ); // This allows you to change the color after applying toLargeText16bold
  Widget get toLargeText16400 => Text(
        this,
        style: Get.textTheme.titleLarge
            ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
      ); // This allows you to change the color after applying toLargeText16bold
  Widget get title => Text(
        this,
        style: Get.theme.appBarTheme.titleTextStyle,
      );

  Widget toText({Color? color, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      this,
      style: Get.textTheme.titleLarge?.copyWith(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? color),
    );
  }

  Widget get toMediumText14 => Text(
        this,
        style: Get.textTheme.titleLarge
            ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
      );
  Widget get toSmallText12 => Text(
        this,
        style: Get.textTheme.titleLarge?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: "background: #B8B8B8;".toHexColor()),
      );
  Widget get toSmallText10 => Text(
        this,
        style: Get.textTheme.titleLarge?.copyWith(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      );
}
