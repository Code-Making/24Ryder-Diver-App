import 'package:get/get.dart';

import '../controllers/rider_document_upload_controller.dart';

class RiderDocumentUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderDocumentUploadController>(
      () => RiderDocumentUploadController(),
    );
  }
}
