import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../store/news_store.dart';



class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        store: NewsStoreFactory().create(),
      ),
    );
  }
}
