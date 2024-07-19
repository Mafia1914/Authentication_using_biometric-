import 'package:get/get.dart';
import '../../../mixins/loading_mixin.dart';
import '../../home/controllers/home_controller.dart';
import '../../setting/controllers/setting_controller.dart';

enum SelectedTab { home, profile,search ,setting,notification, other }

class MainController extends GetxController with LoadingMixin {
  final selectedTab = SelectedTab.home.obs;
  @override
  void onInit() {
    super.onInit();
    makeNetworkCalls();
  }

  Future<void> makeNetworkCalls() async {
    Get.find<HomeController>().getTransactionList();
    Get.find<SettingController>().getTransactionList();
  }

  void onHomePressed() => selectedTab.value = SelectedTab.home;
  void onMyProfilePressed() => selectedTab.value = SelectedTab.profile;
  void onMySearchPressed() => selectedTab.value = SelectedTab.search;
  void onMySettingPressed() => selectedTab.value = SelectedTab.setting;
}
