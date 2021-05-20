import 'package:desafio_gpboticario/shared/routers/app_routes.dart';
import 'package:desafio_gpboticario/ui/feed/feed_binding.dart';
import 'package:desafio_gpboticario/ui/feed/feed_page.dart';
import 'package:desafio_gpboticario/ui/login/login_binding.dart';
import 'package:desafio_gpboticario/ui/login/login_page.dart';
import 'package:desafio_gpboticario/ui/news/news_binding.dart';
import 'package:desafio_gpboticario/ui/news/news_page.dart';
import 'package:desafio_gpboticario/ui/register/register_binding.dart';
import 'package:desafio_gpboticario/ui/register/register_page.dart';
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
          return LoginPage();
        }
      },
      binding: _box.hasData('token') ? FeedBinding() : LoginBinding(),
    ),
    GetPage(
      name: AppRouters.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRouters.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRouters.NEWS,
      page: () => NewsPage(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: AppRouters.FEED,
      page: () => FeedPage(),
      binding: FeedBinding(),
    ),
  ];
}
