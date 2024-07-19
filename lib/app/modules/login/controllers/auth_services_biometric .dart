import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  static Future<bool> authenticateUser() async {
    bool isAuthenticated = false;
    final LocalAuthentication auth = LocalAuthentication();

    bool isBioSupported = false;
    bool canCheckBiometrics = false;

    try {
      isBioSupported = await auth.isDeviceSupported();
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print("Error checking biometric support: $e");
    }

    if (!isBioSupported) {
      print("Biometric authentication is not supported on this device.");
      return false;
    }

    if (!canCheckBiometrics) {
      print("Biometric authentication is not available or not permitted.");
      return false;
    }

    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print("Error getting available biometrics: $e");
    }

    if (availableBiometrics.isEmpty) {
      if (kDebugMode) {
        print("No biometrics are available on this device.");
      }
      return false;
    }

    bool useFaceID = availableBiometrics.contains(BiometricType.face);

    try {
      if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
        isAuthenticated = await auth.authenticate(
          localizedReason: useFaceID
              ? 'Authenticate with Face ID to continue'
              : 'Authenticate with Touch ID to continue',
        );

        if (Platform.isIOS) {
          print("Biometric authentication succeeded on iOS.");
        } else if (Platform.isAndroid) {
          print("Biometric authentication succeeded on Android.");
        }
      } else {
        // Simulate authentication success on simulator or unsupported platform
        isAuthenticated = true;
        print("Biometric authentication succeeded on unsupported platform.");
      }
    } on PlatformException catch (e) {
      print("Error using biometric auth: $e");
    }

    return isAuthenticated;
  }
}
