import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../../mixins/loading_mixin.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/validators.dart';
import '../../../widgets/x_text_field.dart';

class LoginController extends GetxController with LoadingMixin {
  bool isDeviceSupport = false;
  List<BiometricType>? availableBiometrics;
  LocalAuthentication? auth;
  final formKey = GlobalKey<FormState>();
  final emailFieldData = TextFieldData(
    validator: Validator.emailValidator,
    keyboardType: TextInputType.emailAddress,
  );
  final passwordFieldData = TextFieldData(
    validator: Validator.passwordValidator,
    isPassword: true,
  );

  @override
  void onInit() {
    super.onInit();
    auth = LocalAuthentication();
  }

  void onForgotPasswordClicked() {
    // Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  void onSignUpClicked() {
    Get.offAllNamed(Routes.SIGNUP);
  }

  Future<void> onActionLoginClicked() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading = true;
    try {
      final storage = FlutterSecureStorage();

      await storage.write(
        key: 'email',
        value: emailFieldData.textInField,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );

      await storage.write(
        key: 'password',
        value: passwordFieldData.textInField,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );

      Get.offNamed(Routes.MAIN);
    } catch (e) {
      print("Error: $e");
      // Handle error gracefully
    } finally {
      isLoading = false;
    }
  }

  IOSOptions _getIOSOptions() => IOSOptions(accountName: _getAccountName());

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  String? _getAccountName() => 'MvpGetx';


}
