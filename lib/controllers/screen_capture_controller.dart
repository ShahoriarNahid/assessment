import 'dart:async';
import 'package:assessment/helpers/k_log.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class ScreenCaptureController extends GetxController {
  var interval = 5.obs; // Default interval is 5 seconds
  Timer? timer;
  ScreenshotController screenshotController = ScreenshotController();

  void startCapturingScreenshots() {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer.periodic(Duration(seconds: interval.value), (timer) {
      captureScreenshot();
    });
  }

  void captureScreenshot() async {
    kLog("Screenshot captured");
    final screenshot = await screenshotController.capture();
    kLog("Screenshot captured 4");
    kLog(screenshot);
    if (screenshot != null) {
      // Save or process the screenshot as needed
      kLog("Screenshot captured 5");
      // You can save it to a file or upload it as per your requirements
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
