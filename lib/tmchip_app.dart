import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/splash/views/splash_view.dart';

class TmchipApp extends StatelessWidget {
  const TmchipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "TmchipApp",
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
