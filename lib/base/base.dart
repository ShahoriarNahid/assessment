import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../controllers/screen_capture_controller.dart';
import '../services/network_service.dart';

class Base {
  Base._();
  static final networkService = Get.find<NetworkService>();
  static final controller = Get.find<Controller>();
  static final screenCaptureController = Get.find<ScreenCaptureController>();
}
