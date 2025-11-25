import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/spotliath_controller.dart';

class SpotliathView extends GetView<SpotliathController> {
  const SpotliathView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpotliathView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SpotliathView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
