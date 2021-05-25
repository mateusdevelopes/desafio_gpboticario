import 'package:desafio_gpboticario/shared/routers/app_routes.dart';
import 'package:desafio_gpboticario/ui/dash/dash_binding.dart';
import 'package:desafio_gpboticario/ui/dash/dash_page.dart';
import 'package:desafio_gpboticario/ui/login/login_binding.dart';
import 'package:desafio_gpboticario/ui/login/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final GetStorage _box = GetStorage();

  @override
  void onInit() {
    checkHasLoggedUser();
    super.onInit();
  }

  checkHasLoggedUser() {
    print(_box.read("token"));
    print(_box.read("userId"));
    print(_box.read("name"));
    print(_box.read("token"));
    print(_box.read("avatar"));
    /** USADO fakeToken PARA IDENTIFICAR MELHOR no mockapi o resultado, 
      * espeficia ainda melhor na consulta. O ideal seria usar o id de usuário;
      **/
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (_box.hasData('token')) {
          Get.off(DashPage(), binding: DashBinding());
        } else {
          Get.off(LoginPage(), binding: LoginBinding());
        }
      },
    );
  }
}
