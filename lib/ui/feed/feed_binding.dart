import 'package:desafio_gpboticario/ui/feed/feed_controller.dart';
import 'package:get/get.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FeedController());
  }
}
