import 'package:ecommerce_app/app/modules/setting/store/setting_store.dart';
import 'package:get/get.dart';
import '../../../mixins/loading_mixin.dart';


class SettingController extends GetxController with LoadingMixin {

  SettingController ({required this.store});

  final SettingStore store;
  Future<void> getTransactionList() async {
    isLoading = true;
    await store.getCommentsList();
    isLoading = false;
  }



  @override
  void onInit() {
    super.onInit();
  }


}
