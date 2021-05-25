import 'package:desafio_gpboticario/shared/routers/app_pages.dart';
import 'package:desafio_gpboticario/shared/routers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      initialRoute: AppRouters.SPLASH,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    ),
  );
}
