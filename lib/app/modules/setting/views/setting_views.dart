import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/setting_controller.dart';
import '../widget/custom_usere_card.dart';


class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => controller.getTransactionList());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment View'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (controller.store.allTransactionList.isEmpty) {
            return const Center(child: Text('No posts available.'));
          }
          return ListView.builder(
            itemCount: controller.store.allTransactionList.length,
            itemBuilder: (BuildContext context, int index) {
              final post = controller.store.allTransactionList[index];
              return CommentWidget(
                name: post.name,
                email: post.email,
                body: post.body,
              );
            },
          );
        }),
      ),
    );
  }
}

