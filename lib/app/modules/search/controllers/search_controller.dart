import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../store/search_store.dart';
import 'dart:async';

class searchController extends GetxController with SingleGetTickerProviderMixin {
  final SearchStore store;

  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> lineAnimation;

  searchController({required this.store});

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    lineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future<void> pickImageGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      store.selectedImage.value = pickedFile.path;
      startAnimation();
    }
  }

  Future<void> captureImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      store.selectedImage.value = pickedFile.path;
      startAnimation();
    }
  }

  void startAnimation() {
    animationController.forward(from: 0.0);
  }

  void stopAnimation() {
    animationController.stop();
  }

  Animation<double> getLineAnimation() => lineAnimation;
}




