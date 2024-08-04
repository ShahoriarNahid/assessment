import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../controllers/screen_capture_controller.dart';

class Base {
  Base._();
  static final controller = Get.find<Controller>();
  static final screenCaptureController = Get.find<ScreenCaptureController>();
}
