import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/colors.dart';
import '../button.dart';
import '../x_dialog.dart';



class AlertDialog extends StatelessWidget {
  const AlertDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.actionCancel,
    required this.actionYes,
  }) : super(key: key);

  final String title;
  final String message;
  final String actionCancel;
  final String actionYes;

  @override
  Widget build(BuildContext context) {
    return XDialog(
      title: title,
      content: Text(message),
      actions: [
        // Button.dialog(
        //   action: actionCancel,
        //   onPressed: _onCancelPressed,
        // ),
        // Button.dialog(
        //   action: actionYes,
        //   color: XColors.xRed,
        //   onPressed: _onContinuePressed,
        // ),
      ],
    );
  }

  void _onCancelPressed() {
    Get.back(result: false);
  }

  void _onContinuePressed() {
    Get.back(result: true);
  }
}
