import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tmchip_app/app/modules/explore/views/explore_view.dart';

class BottomNavigationController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final List<Widget> pages = [ExploreView()];

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
