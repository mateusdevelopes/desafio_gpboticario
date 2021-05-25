import 'package:desafio_gpboticario/shared/routers/app_routes.dart';
import 'package:desafio_gpboticario/ui/dash/dash_binding.dart';
import 'package:desafio_gpboticario/ui/dash/dash_page.dart';
import 'package:desafio_gpboticario/ui/feed/feed_binding.dart';
import 'package:desafio_gpboticario/ui/feed/feed_page.dart';
import 'package:desafio_gpboticario/ui/login/login_binding.dart';
import 'package:desafio_gpboticario/ui/login/login_page.dart';
import 'package:desafio_gpboticario/ui/make_post/make_post_binding.dart';
import 'package:desafio_gpboticario/ui/make_post/make_post_page.dart';
import 'package:desafio_gpboticario/ui/news/news_binding.dart';
import 'package:desafio_gpboticario/ui/news/news_page.dart';
import 'package:desafio_gpboticario/ui/register/register_binding.dart';
import 'package:desafio_gpboticario/ui/register/register_page.dart';
import 'package:desafio_gpboticario/ui/splash/splash_binding.dart';
import 'package:desafio_gpboticario/ui/splash/splash_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    // GetPage(
    //   name: AppRouters.ROOT,
    //   page: () {
    //     if (_box.hasData('token')) {
    //       return Container();
    //     } else {
    //       return LoginPage();
    //     }
    //   },
    //   binding: _box.hasData('token') ? FeedBinding() : LoginBinding(),
    // ),
    GetPage(
      name: AppRouters.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRouters.DASH,
      page: () => DashPage(),
      binding: DashBinding(),
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
    GetPage(
      name: AppRouters.MAKE_POST,
      page: () => MakePostPage(),
      transition: Transition.cupertino,
      binding: MakePostBinding(),
    )
  ];
}
