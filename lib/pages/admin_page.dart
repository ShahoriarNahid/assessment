import 'package:flutter/material.dart';

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
          TextField(
            decoration: const InputDecoration(
              labelText: "Interval in seconds",
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value.isNotEmpty) {
                Base.screenCaptureController.interval.value = int.parse(value);
              }
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: Base.screenCaptureController.startCapturingScreenshots,
            child: const Text("Start Capturing Screenshots"),
          ),
        ],
      ),
    );
  }
}
