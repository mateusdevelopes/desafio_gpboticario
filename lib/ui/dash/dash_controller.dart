import 'dart:io';

import 'package:get/get.dart';

class DashController extends GetxController {
  final _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;

  bool checkPlatform() {
    if (Platform.isAndroid) {
      return true;
    }
    return false;
  }
}
