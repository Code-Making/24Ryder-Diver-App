import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final globalKey = GlobalKey<ScaffoldState>();
  final count = 0.obs;

  void increment() => count.value++;
}
