import 'package:assessment/config/scroll_behavior_modified.dart';
import 'package:assessment/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base/base_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: BaseBindings(),

      defaultTransition: Transition.cupertino,
      builder: (context, widget) {
        ScrollConfiguration(
          behavior: const ScrollBehaviorModified(),
          child: widget!,
        );
        final data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            //textScaleFactor: 1.0,
            textScaler: const TextScaler.linear(1.0),
          ),
          child: widget,
        );
      },
      home: const MainPage(),
      //  const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
