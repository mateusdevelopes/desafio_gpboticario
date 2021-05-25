import 'package:desafio_gpboticario/ui/make_post/make_post_controller.dart';
import 'package:get/get.dart';

class MakePostBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MakePostController());
  }
}
