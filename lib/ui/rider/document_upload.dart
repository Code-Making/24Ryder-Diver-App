import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';

import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/rider/add_vechicle_details.dart';
import 'package:rideapp/ui/rider/select_upload_option.dart';

class DocumentsUpload extends StatefulWidget {
  const DocumentsUpload({super.key});

  @override
  State<DocumentsUpload> createState() => _DocumentsUploadState();
}

class _DocumentsUploadState extends State<DocumentsUpload> {
  var drivingLicenseSelected = false;
  var ghanaidCardSelected = false;
  var voterIdCardSeleted = false;
  bool get allSelected =>
      drivingLicenseSelected && ghanaidCardSelected && voterIdCardSeleted;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(children: [
        const CustomHeader(
          title: '',
          addpadding: false,
        ),
        "Upload Documents"
            .toText(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: "#2A2A2A".toHex(),
            )
            .padding20top
            .marginbottom,
        UploadDocumentWidget(
          isSelected: drivingLicenseSelected,
          title: "Driving license",
          subtitle: "A Driving license is an official document",
          onChanged: (value) {
            setState(() {
              drivingLicenseSelected = true;
            });
          },
        ),
        UploadDocumentWidget(
          isSelected: ghanaidCardSelected,
          title: "National id card",
          subtitle: "Ghana official card",
          onChanged: (value) {
            setState(() {
              ghanaidCardSelected = true;
            });
          },
        ),
        "* These field are required"
            .toText(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: "#FF0000".toHex(),
            )
            .paddingOnly(bottom: 90),
        if (allSelected)
          AppButton(
              label: 'Next',
              onPressed: () {
                Get.to(() => AddVechicleDetails());
              })
      ]),
    );
  }
}

class UploadDocumentWidget extends StatelessWidget {
  const UploadDocumentWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
    this.onChanged,
  });
  final bool isSelected;
  final String title;
  final String subtitle;
  final Function(bool? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (onChanged != null) {
          var result = await Get.bottomSheet<bool>(const SelectUploadOption(),
              isScrollControlled: true);
          onChanged!(result);
        }
      },
      child: Container(
        height: 85,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade100, offset: const Offset(1, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title
                    .toText(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )
                    .marginOnly(bottom: 4),
                subtitle.toText(
                    color: "#717171".toHex(),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ],
            ),
            const Spacer(),
            if (isSelected)
              Image.asset(
                "assets/rider/check.png",
                height: 17,
              )
            else
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: isSelected ? Palette.primary : Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.file_upload_outlined,
                  color: isSelected ? Colors.grey.shade200 : Colors.grey,
                ),
              )
          ],
        ),
      ).marginbottom,
    );
  }
}
