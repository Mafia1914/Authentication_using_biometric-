import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../store/store.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        store: ProfileStoreFactory().create(),
        logoutHelper: Get.find(),
      ),
    );
  }
}
