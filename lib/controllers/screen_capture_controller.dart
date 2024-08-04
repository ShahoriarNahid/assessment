import 'dart:async';
import 'dart:typed_data';
import 'package:assessment/helpers/k_log.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class ScreenCaptureController extends GetxController {
  final ScreenshotController screenshotController = ScreenshotController();
  Timer? _timer;
  RxInt interval = 5.obs; // Default interval in seconds
  RxBool isCapturing = false.obs;
  RxList<Uint8List> screenshots = <Uint8List>[].obs;

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startCapturing() {
    isCapturing.value = true;
    _timer = Timer.periodic(Duration(seconds: interval.value), (timer) {
      takeScreenshot();
    });
  }

  void stopCapturing() {
    isCapturing.value = false;
    _timer?.cancel();
  }

  void setInterval(int newInterval) {
    interval.value = newInterval;
    if (isCapturing.value) {
      stopCapturing();
      startCapturing();
    }
  }

  Future<void> takeScreenshot() async {
    Uint8List? image = await screenshotController.capture();
    if (image != null) {
      screenshots.add(image);
      kLog('Screenshot captured');
    }
  }
}
