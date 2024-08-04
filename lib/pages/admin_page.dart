import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text('This is the user page to capture screenshots from.'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  // Base.screenCaptureController.isCapturing.value
                  //     ? Base.screenCaptureController.stopCapturing
                  //     : Base.screenCaptureController.startCapturing,
                  child: Obx(() => Text(Base.screenCaptureController.isCapturing.value ? 'Stop' : 'Start')),
                ),
                SizedBox(width: 10),
                DropdownButton<int>(
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
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: Base.screenCaptureController.screenshots.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.memory(Base.screenCaptureController.screenshots[index]),
                  );
                },
              );
            }),
          ),
        ],
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