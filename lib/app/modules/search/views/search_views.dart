import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<searchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                await controller.pickImageGallery();
              },
              child: const Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await controller.captureImage();
              },
              child: const Text('Capture Image from Camera'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              final selectedImagePath = controller.store.selectedImage.value;
              final isAnimating = controller.animationController.isAnimating;

              return Stack(
                alignment: Alignment.center,
                children: [
                  if (selectedImagePath.isEmpty)
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Text('No Image Selected'),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        image: DecorationImage(
                          image: FileImage(File(selectedImagePath)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  if (isAnimating)
                    AnimatedBuilder(
                      animation: controller.getLineAnimation(),
                      builder: (context, child) {
                        return Positioned(
                          top: controller.getLineAnimation().value * 400, // Adjust position as needed
                          left: 0,
                          right: 0,
                          height: 4, // Adjust line height as needed
                          child: Container(
                            color: Colors.blueAccent, // Adjust line color as needed
                          ),
                        );
                      },
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}



