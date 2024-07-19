import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../mixins/loading_mixin.dart';
import '../store/news_store.dart';

class HomeController extends GetxController with LoadingMixin{
 HomeController({required this.store});
 final NewsStore store;
 final searchController = TextEditingController();

 final eButton = true.obs;
 final jButton = false.obs;
 final mButton = false.obs;
 final wButton = false.obs;

 @override
 void onInit() {
   store.allTransactionList.clear();
   super.onInit();

 }


 Future<void> getTransactionList() async {
   isLoading = true;
    await store.getTransactionList();
    isLoading = false;
  }

  void eButtonClick(){



  }

}
