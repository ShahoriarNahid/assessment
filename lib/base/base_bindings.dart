import 'package:get/get.dart';

import '../controllers/controller.dart';
import '../services/network_service.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkService());
    Get.lazyPut(() => Controller());
  }
}
