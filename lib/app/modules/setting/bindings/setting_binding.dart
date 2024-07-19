import 'package:get/get.dart';
import '../controllers/setting_controller.dart';
import '../store/setting_store.dart';


class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
          () => SettingController(
        store: SettingStoreFactory().create(),
      ),
    );
  }
}

