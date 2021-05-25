import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class SnackBars {
  void errorSnackbar({@required String msg}) {
    return Get.snackbar("Erro", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[400],
        colorText: Colors.white);
  }

  void successSnackbar({@required String msg}) {
    return Get.snackbar("Sucesso", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green[400],
        colorText: Colors.white);
  }

  void wanningSnackbar({@required String msg}) {
    return Get.snackbar("Aviso", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.yellow[400],
        colorText: Colors.white);
  }

  void infoSnackbar({@required String msg}) {
    return Get.snackbar("Atenção", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.blue[400],
        colorText: Colors.white);
  }
}