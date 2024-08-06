import 'package:assessment/helpers/k_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../base/base.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: KText(
                text: 'This is the Admin page to Ability that capture screenshots at adjustable intervals & show the screenshots.',
                maxLines: 3,
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KText(text: 'Time Interval: '),
                const SizedBox(width: 10),
                Obx(() => DropdownButton<int>(
                      value: Base.screenCaptureController.interval.value,
                      items: [5, 10, 15, 20, 30]
                          .map((e) => DropdownMenuItem<int>(
                                value: e,
                                child: Text('$e seconds'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          Base.screenCaptureController.setInterval(value);
                        }
                      },
                    )),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                ),
                itemCount: Base.screenCaptureController.screenshots.length,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              width: Get.width,
                              // ignore: sort_child_properties_last
                              child: PhotoView(
                                // minScale: .8,
                                imageProvider: MemoryImage(
                                  Base.screenCaptureController.screenshots[index],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          fullscreenDialog: true,
                          opaque: false,
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Image.memory(Base.screenCaptureController.screenshots[index]),
                        ),
                      ),
                    ),
                  );
                },

                // Expanded(
                //   child: Obx(() {
                //     return ListView.builder(
                //       itemCount: Base.screenCaptureController.screenshots.length,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Image.memory(Base.screenCaptureController.screenshots[index]),
                //         );
                //       },
                //     );
                //   }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  //  TextField(
  //           decoration: const InputDecoration(
  //             labelText: "Interval in seconds",
  //           ),
  //           keyboardType: TextInputType.number,
  //           onChanged: (value) {
  //             if (value.isNotEmpty) {
  //               Base.screenCaptureController.interval.value = int.parse(value);
  //             }
  //           },
  //         ),
  //         const SizedBox(height: 20),
  //         ElevatedButton(
  //           onPressed: Base.screenCaptureController.startCapturingScreenshots,
  //           child: const Text("Start Capturing Screenshots"),
  //         ),