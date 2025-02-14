import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/rider/add_vechicle_details.dart';
import '../controllers/rider_document_upload_controller.dart';

class RiderDocumentUploadView extends GetView<RiderDocumentUploadController> {
  const RiderDocumentUploadView({Key? key}) : super(key: key);
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
          isSelected: controller.drivingLicenseSelected.isTrue,
          title: "Driving license",
          subtitle: "A Driving license is an official document",
          onChanged: (file) {
            controller.drivingLicenseSelected(true);
          },
        ),
        UploadDocumentWidget(
          isSelected: controller.ghanaidCardSelected.isTrue,
          title: "Ghana id card",
          subtitle: "Ghana official card",
          onChanged: (file) {
            controller.ghanaidCardSelected(true);
          },
        ),
        UploadDocumentWidget(
          isSelected: controller.voterIdCardSeleted.isTrue,
          title: "Voter id card",
          subtitle: "Voter id card is an official document",
          onChanged: (file) {
            controller.voterIdCardSeleted(true);
          },
        ),
        UploadDocumentWidget(
          isSelected: controller.passportSelected.isTrue,
          title: "Passport",
          subtitle: "Voter id card is an official document",
          onChanged: (file) {
            controller.passportSelected(true);
          },
        ),
        UploadDocumentWidget(
          isSelected: controller.vehicleLicenseSelected.isTrue,
          title: "Vehicle License",
          subtitle: "Voter id card is an official document",
          onChanged: (file) {
            controller.vehicleLicenseSelected(true);
          },
        ),
        UploadDocumentWidget(
          isSelected: controller.insuranceDocumentSelected.isTrue,
          title: "Insurance Document",
          subtitle: "Voter id card is an official document",
          onChanged: (file) {
            controller.insuranceDocumentSelected(true);
          },
        ),
        "* These fields are required"
            .toText(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: "#FF0000".toHex(),
            )
            .paddingOnly(bottom: 90),
        if (controller.allSelected)
          AppButton(
              label: 'Next',
              onPressed: () {
                Get.to(() => const AddVechicleDetails());
              })
      ]),
    );
  }
}

class UploadDocumentWidget extends StatefulWidget {
  final bool isSelected;
  final String title;
  final String subtitle;
  final Function(bool) onChanged; // Now accepts a boolean

  const UploadDocumentWidget({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.subtitle,
    required this.onChanged,
  }) : super(key: key);

  @override
  _UploadDocumentWidgetState createState() => _UploadDocumentWidgetState();
}

class _UploadDocumentWidgetState extends State<UploadDocumentWidget> {
  File? _selectedImage;
  bool _isUploading = false; // Track uploading state

  Future<void> _pickImage(ImageSource source) async {
    setState(() {
      _isUploading = true; // Set uploading state to true
    });

    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isUploading = false; // Reset uploading state
      });

      widget.onChanged(true); // Notify parent widget that upload is done
    } else {
      setState(() {
        _isUploading = false; // Reset if no image is picked
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.bottomSheet(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Options Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      // Title
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Select Upload Option",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        leading: const Icon(Icons.camera),
                        title: const Text("Take a photo"),
                        onTap: () async {
                          await _pickImage(ImageSource.camera);
                          Get.back();
                        },
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.image),
                        title: const Text("Choose from gallery"),
                        onTap: () async {
                          await _pickImage(ImageSource.gallery);
                          Get.back();
                        },
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Cancel Button
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        );
      },
      child: Container(
        height: 85,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade100, offset: const Offset(2, 6))
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
                widget.title
                    .toText(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )
                    .marginOnly(bottom: 4),
                widget.subtitle.toText(
                    color: "#717171".toHex(),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ],
            ),
            const Spacer(),
            if (_selectedImage != null)
              Image.asset("assets/rider/check.png", width: 24, height: 24)
            else
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: _isUploading
                      ? const Color(0xFF302D81)
                      : Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _selectedImage != null
                      ? Icons.check_circle
                      : Icons.file_upload_outlined,
                  color: _isUploading
                      ? Colors.white
                      : (_selectedImage != null ? Colors.white : Colors.grey),
                ),
              ),
          ],
        ),
      ).marginbottom,
    );
  }
}
