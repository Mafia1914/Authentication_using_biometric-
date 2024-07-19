import 'package:flutter/material.dart';
import '../../../assets/assets.dart';
import '../../../constants/app_sizes.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.line_weight_sharp),
               gapW120,
              Image.asset(
                ImageAsset.appLogo,
                width: Sizes.p96,
                height: Sizes.p96,
              ),
            ],
          ),

          Image.asset(
            ImageAsset.xUser,
            width: Sizes.p48,
            height: Sizes.p48,
          ),
        ],
      ),
      // You can customize the AppBar here
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
