import 'package:ecommerce_app/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';


const buttonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

ButtonStyle _createPrimaryButtonStyle({
  Color? color,
  double? elevation,
  EdgeInsets? padding,
  BorderSide? side,
  required double borderRadius,
}) =>
    ElevatedButton.styleFrom(
      backgroundColor: color ?? XColors.primary,
      minimumSize: const Size(48, 48),
      foregroundColor: Colors.white,
      elevation: elevation,
      padding: padding,
      side: side,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );


ButtonStyle _createPrimaryButtonWithHeightStyle({
  Color? color,
  double? elevation,
  EdgeInsets? padding,
  double? height,
  double? borderRadius,
}) =>
    ElevatedButton.styleFrom(
      backgroundColor: color ?? XColors.primary,
      minimumSize: Size(48, height!),
      foregroundColor: Colors.white,
      elevation: elevation,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
    );

final _secondaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: XColors.secondary,
  minimumSize: const Size(48, 48),
  foregroundColor: Colors.white,
  textStyle: buttonTextStyle,
);

ButtonStyle _createOutlinedButtonStyle(Color? borderColor) => OutlinedButton.styleFrom(
      minimumSize: const Size(48, 48),
      textStyle: buttonTextStyle,
      side: BorderSide(color: borderColor ?? Colors.white),
    );

final _textButtonStyle = TextButton.styleFrom(
  minimumSize: const Size(48, 48),
);

class Button {
  Button._();

  static Widget primary({
    required Widget child,
    Color? color,
    double? elevation,
    VoidCallback? onPressed,
    EdgeInsets? padding,
    BorderSide? border,
    double? borderRadius = 8.0,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _createPrimaryButtonStyle(
        color: color,
        elevation: elevation,
        padding: padding,
        side: border,
        borderRadius: borderRadius ?? 8.0,
      ),
      child: DefaultTextStyle(
        style: buttonTextStyle,
        child: child,
      ),
    );
  }
}


class XBackButton extends StatelessWidget {
  const XBackButton({
    Key? key,
    this.icon = Icons.arrow_back_sharp,
    this.onPressed,
    this.color = XColors.xBlack,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      onPressed: onPressed,
    );
  }
}

class ActionTextButton extends StatelessWidget {
  const ActionTextButton({Key? key, this.onPressed, required this.child}) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: child,
        ),
      ),
    );
  }
}

class ActionElevatedButton extends StatelessWidget {
  const ActionElevatedButton({
    Key? key,
    this.onPressed,
    this.color,
    required this.child,
    this.padding,
    this.elevation,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? color;
  final Widget child;
  final EdgeInsets? padding;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: padding,
            elevation: elevation,
          ),
          child: child,
        ),
      ),
    );
  }
}

class XFilterButton extends StatelessWidget {
  const XFilterButton({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(const Size(72, 32)),
      child: SizedBox(
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(side: const BorderSide(color: XColors.xBlue)),
          child: Text('Filter', style: Get.textTheme.bodyText3Bold?.copyWith(color: XColors.xBlue)),
        ),
      ),
    ).paddingSymmetric(horizontal: 16);
  }
}

typedef CheckedCallback = void Function(bool selected);

class CheckedButton extends StatelessWidget {
  const CheckedButton({
    Key? key,
    required this.onAction,
    required this.child,
    required this.isChecked,
    this.isEnabled = true,
  }) : super(key: key);

  final bool isChecked;
  final CheckedCallback onAction;
  final Widget child;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final backGroundColor = isChecked
        ? XColors.primary[100]
        : isEnabled
            ? Colors.white
            : XColors.xGrey[100];
    final borderColor = isChecked
        ? XColors.primary
        : isEnabled
            ? XColors.xGrey
            : XColors.xGrey[300]!;
    return InkWell(
      onTap: () {
        if (isEnabled) {
          onAction(!isChecked);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: borderColor),
        ),
        child: child,
      ),
    );
  }
}
