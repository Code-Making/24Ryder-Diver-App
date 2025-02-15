import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:rideapp/ui/rider/add_vechicle_details.dart';

class RiderDocumentUploadController extends GetxController {
  var drivingLicenseSelected = false.obs;
  var ghanaIdCardSelected = false.obs;
  var voterIdCardSelected = false.obs;
  var passportSelected = false.obs;
  var vehicleLicenseSelected = false.obs;
  var insuranceDocumentSelected = false.obs;

  String? drivingLicensePath;
  String? ghanaIdCardPath;
  String? voterIdCardPath;
  String? passportPath;
  String? vehicleLicensePath;
  String? insuranceDocumentPath;

  bool get allSelected => [
        drivingLicenseSelected.value,
        ghanaIdCardSelected.value,
        voterIdCardSelected.value,
        passportSelected.value,
        vehicleLicenseSelected.value,
        insuranceDocumentSelected.value,
      ].every((selected) => selected);

  final String apiUrl =
      'https://taxi.servermaster.online/taxi_app/api/driver_upload_document';
  final Map<String, String> headers = {
    'Accept': 'application/json',
    'Authorization':
        'N2Q5N0t1VE05NkYwY3hqdmx1VUhBQT09-cEZOdms0M3pKUWpzQ1VDNTFpNUlKUT09-ekhvRkhDN0gzODBXWU1oeC94S3FpQT09'
  };

  Future<void> pickDocument(String docType) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      switch (docType) {
        case 'driving_license':
          drivingLicensePath = result.files.single.path;
          drivingLicenseSelected.value = true;
          break;
        case 'ghana_id_card':
          ghanaIdCardPath = result.files.single.path;
          ghanaIdCardSelected.value = true;
          break;
        case 'voter_id_card':
          voterIdCardPath = result.files.single.path;
          voterIdCardSelected.value = true;
          break;
        case 'passport':
          passportPath = result.files.single.path;
          passportSelected.value = true;
          break;
        case 'vehicle_license':
          vehicleLicensePath = result.files.single.path;
          vehicleLicenseSelected.value = true;
          break;
        case 'insurance_document':
          insuranceDocumentPath = result.files.single.path;
          insuranceDocumentSelected.value = true;
          break;
      }
    } else {
      Get.snackbar('Error', 'No file selected for $docType');
    }
  }

  Future<void> uploadDocuments() async {
    if (!allSelected) {
      Get.snackbar('Missing Documents', 'All documents are required');
      return;
    }

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.headers.addAll(headers);

    Map<String?, String?> paths = {
      'driving_license': drivingLicensePath,
      'ghana_id_card': ghanaIdCardPath,
      'voter_id_card': voterIdCardPath,
      'passport': passportPath,
      'vehicle_license': vehicleLicensePath,
      'insurance_document': insuranceDocumentPath,
    };

    for (var entry in paths.entries) {
      if (entry.value != null) {
        request.files.add(
          await http.MultipartFile.fromPath(entry.key!, entry.value!),
        );
      } else {
        Get.snackbar('Error', 'Missing file for ${entry.key}');
        return;
      }
    }

    try {
      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);

      if (response.statusCode == 200 && jsonResponse['status'] == true) {
        Get.snackbar('Success', jsonResponse['message']);
        Get.to(() => AddVechicleDetails());
      } else {
        Get.snackbar(
            'Error', jsonResponse['message'] ?? 'Failed to upload documents');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while uploading documents');
    }
  }
}
