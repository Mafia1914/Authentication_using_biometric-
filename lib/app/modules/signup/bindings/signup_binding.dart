import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import '../store/store.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(
        store: SignUpStoreFactory().create(),
      ),
    );
  }
}
