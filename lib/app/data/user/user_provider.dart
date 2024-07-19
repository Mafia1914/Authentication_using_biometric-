
import 'package:get/get.dart';


import '../auth/auth_provider.dart';

class UserProvider extends GetxController{
  UserProvider({
    required this.authProvider,
  });


  final AuthProvider authProvider;

  @override
  void onInit() {
    super.onInit();
    loadInstructorProfileLocally();
  }

 
   Future<void> loadInstructorProfileLocally() async {
    if (await authProvider.getToken() != null) {
      
    }
  }
 
}
