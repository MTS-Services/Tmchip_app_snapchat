import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchip_app/app/routes/app_pages.dart';

class TmchipApp extends StatelessWidget {
  const TmchipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SnapChat",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initaial,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'AvenirNext',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white,)
      ),
    );
  }
}
