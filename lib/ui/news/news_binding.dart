import 'package:desafio_gpboticario/ui/news/news_controller.dart';
import 'package:get/get.dart';

class NewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NewsController());
  }
}
