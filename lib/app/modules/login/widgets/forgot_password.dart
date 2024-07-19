import 'package:ecommerce_app/app/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/string_constants.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({required this.clickActionHandle, Key? key}) : super(key: key);

  final VoidCallback clickActionHandle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Get.textTheme.bodyText3,
        children: [
          const TextSpan(text: NameConstant.kForgotYourPass),
          TextSpan(
            style: Get.textTheme.buttonTextExtraSmall.copyWith(
              color: XColors.xPink[650],

              decoration: TextDecoration.underline,
            ),
            text: ' ${NameConstant.kResetPass}',
            recognizer: TapGestureRecognizer()..onTap = clickActionHandle,
          ),
        ],
      ),
    );
  }
}
