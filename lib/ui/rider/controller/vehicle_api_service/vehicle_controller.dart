import 'package:get/get.dart';
import 'package:rideapp/ui/rider/controller/vehicle_api_service/vehicle_api_service.dart';

class VehicleController extends GetxController {
  var makesList = <Map<String, dynamic>>[].obs;
  var modelsList = <Map<String, dynamic>>[].obs;
  var yearsList = <Map<String, dynamic>>[].obs;

  var selectedMakeId = ''.obs;
  var selectedModelId = ''.obs;
  var selectedYearId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMakes();
  }

  void fetchMakes() async {
    makesList.value = await VehicleApiService.getMakes();
  }

  void selectMake(String makeId) async {
    selectedMakeId.value = makeId;

    // Reset and clear models and years
    selectedModelId.value = '';
    selectedYearId.value = '';
    modelsList.clear();
    yearsList.clear();

    // Fetch new models based on selected make
    final models = await VehicleApiService.getModels(makeId);
    modelsList.value = models;
  }

  void selectModel(String modelId) async {
    selectedModelId.value = modelId;

    // Reset and clear years
    selectedYearId.value = '';
    yearsList.clear();

    // Fetch new years based on selected model
    final years = await VehicleApiService.getYears(modelId);
    yearsList.value = years;
  }

  void selectYear(String yearId) {
    selectedYearId.value = yearId;
  }
}
