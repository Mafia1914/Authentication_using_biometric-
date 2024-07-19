import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/store/news_store.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../profile/store/store.dart';
import '../../search/controllers/search_controller.dart';
import '../../search/store/search_store.dart';
import '../../setting/controllers/setting_controller.dart';
import '../../setting/store/setting_store.dart';
import '../controllers/main_controller.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get
    ..lazyPut<MainController>(
      () => MainController(),
    )
    ..lazyPut<HomeController>(() => HomeController(
       store: NewsStoreFactory().create(),
    ),)
    ..lazyPut<ProfileController>(() => ProfileController(
      store: ProfileStoreFactory().create(),
      logoutHelper: Get.find(),
      
    ))
    ..lazyPut<SettingController>(() => SettingController(
    store: SettingStoreFactory().create(),

    ))

    ..lazyPut<SettingController>(() => SettingController(
    store: SettingStoreFactory().create(),

    ))
    ..lazyPut<searchController>(() => searchController(
    store: SearchStoreFactory().create(),
    ));
  }



}
