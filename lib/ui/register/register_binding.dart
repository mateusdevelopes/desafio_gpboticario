import 'package:desafio_gpboticario/ui/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
