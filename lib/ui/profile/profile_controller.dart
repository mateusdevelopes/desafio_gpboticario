import 'package:desafio_gpboticario/ui/splash/splash_binding.dart';
import 'package:desafio_gpboticario/ui/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final GetStorage _box = GetStorage();
  var name;
  var avatar;

  @override
  void onInit() {
    name = _box.read("name");
    avatar = _box.read("avatar");
    super.onInit();
  }

  logOut() {
    _box.erase();
    Get.off(SplashPage(), binding: SplashBinding());
  }
}
