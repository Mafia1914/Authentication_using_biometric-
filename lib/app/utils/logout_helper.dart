import 'package:ecommerce_app/app/utils/secure_storage/secure_storage.dart';
import 'package:get/get.dart';


import '../data/auth/auth_provider.dart';
import '../data/user/user_provider.dart';
import '../routes/app_pages.dart';

class LogoutHelper {
  LogoutHelper({
    required this.authProvider,
    required this.userProvider,
    
  });

  final UserProvider userProvider;
  final AuthProvider authProvider;


  Future<void> logout() async {
 
    SecureStorage()
      ..deleteValueFromStorage('email')
      ..deleteValueFromStorage('password');
    // authProvider.clearPreferences();
    Get.offAllNamed(Routes.LOGIN);
  }
}
