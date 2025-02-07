import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:rideapp/ui/pages/home/payments/payment_method.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/custom_input.dart';
import 'package:rideapp/ui/pages/widgets/textstyles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(children: [
        const CustomHeader(
          title: 'Edit Profile',
          addpadding: false,
        ),
        60.toh,
        SizedBox(
          height: 138,
          width: 138,
          child: Stack(
            children: [
              Image.asset(
                "assets/Ellipse 43.png",
                height: 138,
                width: 138,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Image.asset(
                    "assets/icons/Edit Image_blue.png",
                    height: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        24.toh,
        "Nate Samson".toText(color: "#5A5A5A".toHex(), fontSize: 28),
        const CustomInputField(
          hintText: 'eg.nate@email.com',
        ).padding20top.padding20top,
        InternationalPhoneNumberInput(
          initialValue: PhoneNumber(
            isoCode: "IN",
            phoneNumber: '',
          ),
          validator: (str) {
            return null;
          },
          selectorTextStyle: AppTextStyles.normal.copyWith(
            color: Colors.black,
          ),
          textStyle: AppTextStyles.normal.copyWith(
            color: Colors.black,
          ),
          searchBoxDecoration: const InputDecoration(
            hintText: "Search ...",
          ),
          inputDecoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              hintText: "Mobile Number",
              isDense: false,
              errorStyle:
                  TextStyle(fontSize: 10.spMin, color: Colors.red.shade800),
              errorMaxLines: 2,
              hintStyle: AppTextStyles.normal.copyWith(
                color: "#FFFFFF".toHex(),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              // prefixIconConstraints: BoxConstraints(
              //     minWidth: 0, maxHeight: Platform.isIOS ? 24.r : 18.r),
              suffixIconConstraints:
                  BoxConstraints(minWidth: 0, maxHeight: 18.r),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade800)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primaryBlue)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400))),
          onInputChanged: (e) {},
          onInputValidated: (bool value) {},
          selectorConfig: const SelectorConfig(
              setSelectorButtonAsPrefixIcon: true,
              useEmoji: true,
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              useBottomSheetSafeArea: true,
              leadingPadding: 12),
          ignoreBlank: false,
          formatInput: true,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          inputBorder: const UnderlineInputBorder(),
          onSaved: (PhoneNumber number) {},
        ).paddingOnly(top: 20),
        DropdownButtonFormField(
          decoration: InputDecoration(
            isDense: false,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            counterText: "",
            hintText: "Select your gender",
            errorStyle:
                TextStyle(fontSize: 10.spMin, color: Colors.red.shade800),
            errorMaxLines: 2,
            hintStyle: AppTextStyles.normal.copyWith(
              color: "#5A5A5A".toHex(),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            suffixIconConstraints: BoxConstraints(minWidth: 0, maxHeight: 18.r),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade800),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.primaryBlue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
          items: ["Male", "Female"]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ))
              .toList(),
          onChanged: (v) {},
          style: const TextStyle(
              color: Colors.black), // Selected value appears in black
        ).padding20top,
        const CustomInputField(
          enabled: true,
          hintText: 'Address',
        ).padding20top,
        AppButton(label: 'Update', onPressed: () {}).padding20top.padding20top,
        const SizedBox(
          height: 40,
        ),
      ]),
    );
  }
}

class Base extends StatelessWidget {
  const Base(
      {super.key,
      required this.children,
      this.isScrollView = true,
      this.addPadding = true});

  final List<Widget> children;
  final bool isScrollView;
  final bool addPadding;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isScrollView == false
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: addPadding ? 16 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: children,
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: addPadding ? 16 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: children,
              ),
            ),
    );
  }
}
