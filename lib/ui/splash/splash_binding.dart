import 'package:desafio_gpboticario/ui/dash/dash_controller.dart';
import 'package:desafio_gpboticario/ui/login/login_controller.dart';
import 'package:desafio_gpboticario/ui/register/register_controller.dart';
import 'package:desafio_gpboticario/ui/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<DashController>(() => DashController());
  }
}
