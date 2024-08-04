import 'dart:async';
import 'package:get/get.dart';

class Controller extends GetxController {
  final clockTime = Rx<int>(0);
  late Timer timer;
  final isTiming = RxBool(false);
  final isPause = RxBool(false);

  void startClock() {
    isTiming.value = true;
    isPause.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      clockTime.value += 1;
    });
  }

  Future<void> pauseClock() async {
    timer.cancel();

    isTiming.value = false;
    isPause.value = true;
  }

  Future<void> stopClock() async {
    timer.cancel();

    clockTime.value = 0;
    isTiming.value = false;
    isPause.value = false;
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
