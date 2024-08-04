import 'package:assessment/pages/admin_page.dart';
import 'package:assessment/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size?>(const Size(109, 35)),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                visualDensity: const VisualDensity(horizontal: 2),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              onPressed: () {
                Get.to(() => const AdminPage());
              },
              child: const Text(
                'Admin',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size?>(const Size(109, 35)),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                visualDensity: const VisualDensity(horizontal: 2),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              onPressed: () {
                Get.to(() => const UserPage());
              },
              child: const Text(
                'User',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
