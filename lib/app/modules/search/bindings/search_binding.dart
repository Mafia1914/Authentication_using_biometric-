import 'package:get/get.dart';
import '../controllers/search_controller.dart';
import '../store/search_store.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
          () => SearchController(
        store: SearchStoreFactory().create(),
        logoutHelper: Get.find(),
      ),
    );
  }
}