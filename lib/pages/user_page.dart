import 'package:assessment/helpers/k_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../base/base.dart';
import '../helpers/k_text.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: Base.screenCaptureController.screenshotController,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            title: const Text('Attendance Clock Timer'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 2.0,
                        ),
                      ]),
                      child: CircleAvatar(
                        //radius: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Icon(Icons.person),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: 'Abdullah Al Akib',
                          bold: true,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        Obx(() => KText(
                              text:
                                  '${(Base.controller.clockTime ~/ 3600).toInt().toString().padLeft(2, '0')}:${((Base.controller.clockTime % 3600) ~/ 60).toInt().toString().padLeft(2, '0')}:${(Base.controller.clockTime % 60).toInt().toString().padLeft(2, '0')}',
                              fontSize: 18,
                            )),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all<Size?>(const Size(80, 35)),
                            backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
                            visualDensity: const VisualDensity(horizontal: 2),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Base.controller.pauseClock();
                            if (Base.screenCaptureController.isCapturing.value) {
                              Base.screenCaptureController.stopCapturing();
                              kLog('stop capture');
                            } else {
                              Get.snackbar(
                                'Attention!!',
                                'wait',
                                colorText: Colors.black,
                                backgroundColor: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                maxWidth: 190,
                              );
                            }
                          },
                          child: KText(
                            text: 'Take a Break',
                            bold: true,
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all<Size?>(const Size(60, 35)),
                            backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                            visualDensity: const VisualDensity(horizontal: 2),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Base.controller.stopClock();
                            if (Base.screenCaptureController.isCapturing.value) {
                              Base.screenCaptureController.stopCapturing();
                              kLog('stop capture');
                            } else {
                              Get.snackbar(
                                'Attention!!',
                                'wait',
                                colorText: Colors.black,
                                backgroundColor: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                maxWidth: 190,
                              );
                            }
                          },
                          child: KText(
                            text: 'Clock Out',
                            bold: true,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                KText(
                  text: 'Good Afternoon, Abdullah Al Akib',
                  fontSize: 18,
                ),
                const SizedBox(height: 10),
                if (!Base.controller.isTiming.value)
                  KText(
                    text: 'Yet to start work for today!',
                    color: Colors.black54,
                  ),
                if (Base.controller.isTiming.value)
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'You are currently ',
                            style: TextStyle(color: Colors.green, fontSize: 14, fontFamily: 'Manrope Bold')),
                        TextSpan(
                            text: 'working',
                            style:
                                TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Manrope Bold')),
                      ],
                    ),
                  ),
                if (!Base.controller.isTiming.value)
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all<Size?>(const Size(80, 35)),
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                      visualDensity: const VisualDensity(horizontal: 2),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (Base.controller.isTiming.value) {
                        Get.snackbar(
                          'Attention!!',
                          'Clock is on',
                          colorText: Colors.black,
                          backgroundColor: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          maxWidth: 190,
                        );
                      } else {
                        Base.controller.startClock();
                        if (Base.screenCaptureController.isCapturing.value) {
                          Get.snackbar(
                            'Attention!!',
                            'wait 1',
                            colorText: Colors.black,
                            backgroundColor: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            maxWidth: 190,
                          );
                        } else {
                          Base.screenCaptureController.startCapturing();
                        }
                      }
                    },
                    child: KText(
                      text: 'Clock In',
                      bold: true,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
