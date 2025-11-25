import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stories_controller.dart';

class StoriesView extends GetView<StoriesController> {
  const StoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoriesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StoriesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
