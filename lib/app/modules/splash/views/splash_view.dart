import 'package:ecommerce_app/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../assets/assets.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/string_constants.dart';
import '../controllers/splash_controller.dart';


class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageAsset.appLogo,
              height: Sizes.p256,
              width: Sizes.p256,
            ),
          ],
        ),
      ),
    );
  }
}
