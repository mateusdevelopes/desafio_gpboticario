import 'package:desafio_gpboticario/shared/services/rest_client.dart';
import 'package:desafio_gpboticario/ui/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RestClient());
    // Get.put<IAuthRepository>(AuthRepository());
    // Get.put(LoginController(Get.find()));
    Get.put(LoginController());
  }
}
