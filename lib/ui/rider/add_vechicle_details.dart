import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rideapp/app/core/utils/sharedprefrences.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/custom_dropdown.dart';
import 'package:rideapp/ui/pages/widgets/custom_input.dart';
import 'package:rideapp/ui/rider/controller/vehicle_api_service/vehicle_controller.dart';
import 'package:rideapp/ui/rider/home.dart';

import '../pages/profile/profile.dart';

class AddVechicleDetails extends StatelessWidget {
  final VehicleController vehicleController = Get.put(VehicleController());
  final TextEditingController colorController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController vinController = TextEditingController();

  AddVechicleDetails({super.key});

  Future<void> submitVehicleDetails() async {
    // Retrieve stored user ID
    int? userId = await SharedPrefs.getUserId();

    if (userId == null) {
      Get.snackbar("Error", "User ID not found. Please log in again.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://taxi.servermaster.online/taxi_app/api/add_vehicle'));
      request.body = json.encode({
        "make": vehicleController.selectedMakeId.value,
        "model": vehicleController.selectedModelId.value,
        "year": vehicleController.selectedYearId.value,
        "tag": tagController.text.trim(),
        "vin": vinController.text.trim(),
        "driver_id": userId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var responseData = json.decode(responseBody);
        Get.snackbar(
          "Success",
          responseData["msg"],
        );
        Get.to(() => const RiderHome());
      } else {
        Get.snackbar(
          "Error",
          response.reasonPhrase ?? "Something went wrong",
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(children: [
        const CustomHeader(title: '', addpadding: false).marginbottom,
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

                // Reset model and year when a new make is selected
                vehicleController.selectMake(selectedMakeId);
                vehicleController.selectedModelId.value =
                    ''; // Clear model selection
                vehicleController.selectedYearId.value =
                    ''; // Clear year selection
                vehicleController.modelsList.clear(); // Clear model list
                vehicleController.yearsList.clear(); // Clear year list

                // Fetch models based on new make selection
                // vehicleController.fetchModels(selectedMakeId);
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

        // Tag Number Input Field
        CustomInputField(hintText: 'Tag no', controller: tagController)
            .marginbottom,

        // VIN Number Input Field
        CustomInputField(hintText: 'VIM no', controller: vinController)
            .marginbottom,

        // Finish Button
        AppButton(label: 'Finish', onPressed: submitVehicleDetails),
      ]),
    );
  }
}
