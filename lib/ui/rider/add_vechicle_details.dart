import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/home/payments/payment_method.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/custom_input.dart';
import 'package:rideapp/ui/rider/home.dart';

class AddVechicleDetails extends StatelessWidget {
  const AddVechicleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Base(children: [
        const CustomHeader(
          title: '',
          addpadding: false,
        ).marginbottom,
        'Add Vechicle Details'.toLargeText18700.marginbottom,
        const CustomInputField(
          hintText: 'Make',
        ).marginbottom,
        const CustomInputField(
          hintText: 'Year',
        ).marginbottom,
        ColorPicker(pickerColor: Colors.black, onColorChanged: (color) {}),
        CustomInputField(
          hintText: 'Color',
          onTap: () {},
        ).marginbottom,
        const CustomInputField(
          hintText: 'Tag no',
        ).marginbottom,
        const CustomInputField(
          hintText: 'VIM no',
        ).marginbottom.marginbottom.marginbottom,
        AppButton(
          label: 'Finish',
          onPressed: () {
            Get.to(() => const RiderHome());
          },
        )
      ]),
    );
  }
}
