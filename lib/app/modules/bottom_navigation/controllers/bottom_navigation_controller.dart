
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tmchip_app/app/modules/chat/views/chat_view.dart';
import 'package:tmchip_app/app/modules/explore/views/explore_view.dart';
import 'package:tmchip_app/app/modules/spotliath/views/spotliath_view.dart';
import 'package:tmchip_app/app/modules/stories/views/stories_view.dart';
import '../../home/views/home_view.dart';

class BottomNavigationController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    HomeView(),
    ChatView(),
    ExploreView(),
    StoriesView(),
    SpotliathView()
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
