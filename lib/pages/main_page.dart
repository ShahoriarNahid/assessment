import 'package:flutter/material.dart';

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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Text('data'),
          ],
        ),
      ),
    );
  }
}
