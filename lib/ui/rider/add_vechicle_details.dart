import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/custom_dropdown.dart';
import 'package:rideapp/ui/pages/widgets/custom_input.dart';
import 'package:rideapp/ui/rider/controller/vehicle_api_service/vehicle_controller.dart';
import 'package:rideapp/ui/rider/home.dart';

class AddVechicleDetails extends StatelessWidget {
  final VehicleController vehicleController = Get.put(VehicleController());

  AddVechicleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(children: [
        const CustomHeader(
          title: '',
          addpadding: false,
        ).marginbottom,
        'Add Vehicle Details'.toLargeText18700.marginbottom,

        // Make Dropdown
        Obx(() => CustomDropdownField(
              hintText: 'Make',
              items: vehicleController.makesList
                  .map((e) => e["name"].toString())
                  .toList(),
              onChanged: (value) {
                String selectedMakeId = vehicleController.makesList
                    .firstWhere((e) => e["name"] == value)["make_id"]
                    .toString();
                vehicleController.selectMake(selectedMakeId);
              },
              value: vehicleController.selectedMakeId.value.isNotEmpty
                  ? vehicleController.makesList.firstWhere(
                      (e) =>
                          e["make_id"] ==
                          vehicleController.selectedMakeId.value,
                      orElse: () => {},
                    )["name"]
                  : null,
            )).marginbottom,

        // Model Dropdown
        Obx(() => CustomDropdownField(
              hintText: 'Model',
              items: vehicleController.modelsList
                  .map((e) => e["name"].toString())
                  .toList(),
              onChanged: (value) {
                String selectedModelId = vehicleController.modelsList
                    .firstWhere((e) => e["name"] == value)["model_id"]
                    .toString();
                vehicleController.selectModel(selectedModelId);
              },
              value: vehicleController.selectedModelId.value.isNotEmpty &&
                      vehicleController.modelsList.any((e) =>
                          e["model_id"] ==
                          vehicleController.selectedModelId.value)
                  ? vehicleController.modelsList.firstWhere(
                      (e) =>
                          e["model_id"] ==
                          vehicleController.selectedModelId.value,
                      orElse: () => {},
                    )["name"]
                  : null,
              enabled: vehicleController.modelsList.isNotEmpty,
            )).marginbottom,

        // Year Dropdown
        Obx(() => CustomDropdownField(
              hintText: 'Year',
              items: vehicleController.yearsList
                  .map((e) => e["name"].toString())
                  .toList(),
              onChanged: (value) {
                String selectedYearId = vehicleController.yearsList
                    .firstWhere((e) => e["name"] == value)["year_id"]
                    .toString();
                vehicleController.selectYear(selectedYearId);
              },
              value: vehicleController.selectedYearId.value.isNotEmpty &&
                      vehicleController.yearsList.any((e) =>
                          e["year_id"] ==
                          vehicleController.selectedYearId.value)
                  ? vehicleController.yearsList.firstWhere(
                      (e) =>
                          e["year_id"] ==
                          vehicleController.selectedYearId.value,
                      orElse: () => {},
                    )["name"]
                  : null,
              enabled: vehicleController.yearsList.isNotEmpty,
            )).marginbottom,

        // Color Input Field
        CustomInputField(
          hintText: 'Color',
          onTap: () {},
        ).marginbottom,

        // Tag Number Input Field
        const CustomInputField(
          hintText: 'Tag no',
        ).marginbottom,

        // VIM Number Input Field
        const CustomInputField(
          hintText: 'VIM no',
        ).marginbottom.marginbottom.marginbottom,

        // Finish Button
        AppButton(
          label: 'Finish',
          onPressed: () {
            Get.to(() => const RiderHome());
          },
        ),
      ]),
    );
  }
}
