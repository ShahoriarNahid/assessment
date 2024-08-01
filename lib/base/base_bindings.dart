import 'package:get/get.dart';

import '../controllers/controller.dart';
import '../controllers/screen_capture_controller.dart';
import '../services/network_service.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkService());
    Get.lazyPut(() => Controller());
    Get.lazyPut(() => ScreenCaptureController());
  }
}
