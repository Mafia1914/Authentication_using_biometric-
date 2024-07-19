import 'package:ecommerce_app/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../assets/assets.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../search/views/search_views.dart';
import '../../setting/views/setting_views.dart';
import '../controllers/main_controller.dart';


class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavigationMenu(),
    );
  }
}

class Body extends GetView<MainController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.selectedTab.value.index,
        children: const [
          HomeView(),
          ProfileView(),
          SearchView(),
          SettingView(),
        ],
      ),
    );
  }
}

class BottomNavigationMenu extends GetView<MainController> {
  const BottomNavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BottomAppBar(
        child: Row(
          children: [
            Obx(
              () => BottomNavigationButton(
                icon: SvgPicture.asset(
                  ImageAsset.icHome,
                  color: controller.selectedTab.value == SelectedTab.home ? XColors.xPink : XColors.xGrey,
                  height: 24,
                  width: 24,
                ),
                label: 'Home',
                isSelected: controller.selectedTab.value == SelectedTab.home,
                onPressed: controller.onHomePressed,
              ),
            ),
            Obx(
              () => BottomNavigationButton(
                icon: SvgPicture.asset(
                  ImageAsset.xProfile,
                  color: controller.selectedTab.value == SelectedTab.profile ? XColors.xPink : XColors.xGrey,
                  height: 24,
                  width: 24,
                ),
                label: 'Profile',
                isSelected: controller.selectedTab.value == SelectedTab.profile,
                onPressed: controller.onMyProfilePressed,
              ),
            ),
            Obx(
                  () => BottomNavigationButton(
                icon: SvgPicture.asset(
                  ImageAsset.xSearch,
                  color: controller.selectedTab.value == SelectedTab.search ? XColors.xPink : XColors.xGrey,
                  height: 24,
                  width: 24,
                ),
                label: 'Search',
                isSelected: controller.selectedTab.value == SelectedTab.search,
                onPressed: controller.onMySearchPressed,
              ),
            ),
            Obx(
                  () => BottomNavigationButton(
                icon: SvgPicture.asset(
                  ImageAsset.xSetting,
                  color: controller.selectedTab.value == SelectedTab.setting ? XColors.xPink : XColors.xGrey,
                  height: 24,
                  width: 24,
                ),
                label: 'Setting',
                isSelected: controller.selectedTab.value == SelectedTab.setting,
                onPressed: controller.onMySettingPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    required this.label,
    this.onPressed,
    this.icon,
    this.isSelected = false,
    this.isShowAlert = false,
    super.key,
  });

  final Widget? icon;
  final String label;
  final bool isSelected;
  final bool isShowAlert;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final color = isSelected ? XColors.xPink : XColors.xBlack[400]!;
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: screenWidth / 4,
        height: 56,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIcon(color, isShowAlert),
                _buildLabel(color),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildIcon(Color color, bool isShowAlert) {
    return SizedBox(
      width: 32,
      height: 34,
      child: Stack(
        children: [
          Align(
            child: IconTheme(
              data: IconThemeData(
                color: color,
              ),
              child: icon ?? Container(),
            ),
          ),
          if (isShowAlert)
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.error, size: 12, color: XColors.xRed),
            ),
        ],
      ),
    );
  }

  Text _buildLabel(Color color) {
    return Text(
      label,
      style: Get.textTheme.bodyText3?.copyWith(
        color: color,
        fontWeight: isSelected ? FontWeight.w600 : null,
      ),
    );
  }
}
