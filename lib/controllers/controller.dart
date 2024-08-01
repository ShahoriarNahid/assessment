import 'dart:async';
import 'package:assessment/helpers/k_log.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class Controller extends GetxController {
  final clockTime = Rx<int>(0);
  late Timer timer;
  final isTiming = RxBool(false);

  void startClock() {
    isTiming.value = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      clockTime.value += 1;
    });
  }

  Future<void> pauseClock() async {
    timer.cancel();

    // videoDuration.value = 0;
    isTiming.value = false;
  }

  Future<void> stopClock() async {
    timer.cancel();

    clockTime.value = 0;
    isTiming.value = false;
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  // final interval = 5.obs; // default interval is 5 seconds
  // ScreenshotController screenshotController = ScreenshotController();

  // void startCapturingScreenshots() {
  //   if (timer != null) {
  //     timer!.cancel();
  //   }
  //   timer = Timer.periodic(Duration(seconds: interval.value), (timer) {
  //     captureScreenshot();
  //   });
  // }

  // void captureScreenshot() async {
  //   final screenshot = await screenshotController.capture();
  //   if (screenshot != null) {
  //     // Save or process the screenshot as needed
  //     kLog("Screenshot captured");
  //   }
  // }

  // var time = '00:00:00'.obs;
  // Timer? _timer;
  // int _seconds = 0;

  // void startTimer() {
  //   _timer?.cancel(); // Cancel any existing timer
  //   _seconds = 0; // Reset the seconds counter
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     _seconds++;
  //     time.value = _formatTime(_seconds);
  //   });
  // }

  // void stopTimer() {
  //   _timer?.cancel();
  //   _timer = null; // Set to null after canceling
  // }

  // String _formatTime(int seconds) {
  //   final int hours = seconds ~/ 3600;
  //   final int minutes = (seconds % 3600) ~/ 60;
  //   final int secs = seconds % 60;
  //   return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  // }
}
