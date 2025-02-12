import 'package:get/get.dart';

class RiderDocumentUploadController extends GetxController {
  //TODO: Implement RiderDocumentUploadController
  var drivingLicenseSelected = false.obs;
  var ghanaidCardSelected = false.obs;
  var voterIdCardSeleted = false.obs;
  var passportSelected = false.obs;
  var vehicleLicenseSelected = false.obs;
  var insuranceDocumentSelected = false.obs;
  final count = 0.obs;
  bool get allSelected =>
      drivingLicenseSelected.isTrue &&
      ghanaidCardSelected.isTrue &&
      voterIdCardSeleted.isTrue &&
      passportSelected.isTrue &&
      vehicleLicenseSelected.isTrue &&
      insuranceDocumentSelected.isTrue;

  void increment() => count.value++;
}
