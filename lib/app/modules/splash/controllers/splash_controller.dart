
import 'package:get/get.dart';
import '../../../data/auth/auth_provider.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  
  @override
  void onReady() {
    super.onReady();
        Future.delayed(const Duration(seconds: 5), () {
       final isAuthrized = Get.find<AuthProvider>().isAuthorized();
      Get.offAndToNamed(isAuthrized? Routes.MAIN :
        Routes.LOGIN);
    });
  }
  
}
