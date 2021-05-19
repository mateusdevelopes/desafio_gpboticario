import 'package:desafio_gpboticario/shared/routers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppPages {
  static GetStorage _box = GetStorage();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRouters.ROOT,
      page: () {
        if (_box.hasData('token')) {
          return Container();
        } else {
          return Container();
        }
      },
      // binding: box.hasData('token') ? HomeDriverBinding() : LoginBinding(),
    ),
    GetPage(
      name: AppRouters.LOGIN,
      page: () => Container(),
      // binding: LoginBinding(),
    ),
  ];
}
