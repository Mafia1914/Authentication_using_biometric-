

import 'package:ecommerce_app/app/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/string_constants.dart';
import '../../../widgets/button.dart';
import '../../../widgets/x_loading_overlay.dart';
import '../../../widgets/x_text_field.dart';
import '../controllers/signup_controller.dart';
import '../widgets/already_account.dart';

// class SignupView extends GetView<SignupController> {
//   const SignupView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => XLoadingOverlay(
//         loading: controller.loading,
//         child: Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 gapH120,
//                 Form(
//                   key: controller.formKeySignUp,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Text(
//                         NameConstant.kSignUp,
//                         style: Get.textTheme.headlineMedium?.copyWith(
//                             color: XColors.xBlack, fontWeight: FontWeight.w700),
//                       ),
//                       gapH16,
//                       Text(
//                         NameConstant.kPleaseSignup,
//                         style: Get.textTheme.titleSmall?.copyWith(
//                             color: XColors.xBlack[800],
//                             fontWeight: FontWeight.w400),
//                       ),
//                       gapH32,
//                       Center(
//                         child: Container(
//                             child: controller.store.selectedImage.value == null
//                                 ? const CircleAvatar(
//                                     radius: 40,
//                                     backgroundColor: XColors.xGrey,
//                                   )
//                                 : CircleAvatar(
//                                     radius: 40,
//                                     backgroundImage: FileImage(File(
//                                         controller.store.selectedImage.value!)),
//                                   )),
//                       ),
//                       gapH16,
//                       Button.primary(
//                           color: XColors.primary,
//                           onPressed: () {
//                             controller.pickImageGallery();
//                           },
//                           child: Text(
//                             'gallery',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyText2Bold
//                                 ?.copyWith(
//                                   color: Colors.white,
//                                 ),
//                           )),
//                       gapH16,
//                       Button.primary(
//                           color: XColors.primary,
//                           onPressed: () {
//                             controller.captureImage();
//                           },
//                           child: Text(
//                             'Capture',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyText2Bold
//                                 ?.copyWith(
//                                   color: Colors.white,
//                                 ),
//                           )),
//                       gapH16,
//                       MTextField(
//                         fieldData: controller.nameFieldData,
//                         hintText: 'Name',
//                       ),
//                       gapH16,
//                       MTextField(
//                         fieldData: controller.emailFieldData,
//                         hintText: 'Email',
//                       ),
//                       gapH16,
//                       MTextField(
//                         fieldData: controller.passwordFieldData,
//                         hintText: 'Password',
//                       ),
//                       gapH16,
//                       MTextField(
//                         fieldData: controller.numberFieldData,
//                         hintText: 'Phone',
//                       ),
//                       gapH32,
//                       Button.primary(
//                         color: XColors.xGreen[500],
//                         onPressed: controller.onActionLoginClicked,
//                         child: const Text(NameConstant.kSignUp),
//                       ),
//                       gapH32,
//                       Align(
//                         child: AlreadyAcount(
//                           clickActionHandle: controller.onSignInClicked,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ).paddingSymmetric(horizontal: 24),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return XLoadingOverlay(
      loading: controller.loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              gapH120,
              Form(
                key: controller.formKeySignUp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      NameConstant.kSignUp,
                      style: Get.textTheme.headlineMedium?.copyWith(
                          color: XColors.xBlack, fontWeight: FontWeight.w700),
                    ),
                    gapH16,
                    Text(
                      NameConstant.createText,
                      style: Get.textTheme.titleSmall?.copyWith(
                          color: XColors.xBlack[800],
                          fontSize: 34,
                          fontWeight: FontWeight.w800),
                    ),
                    // gapH32,
                    // Center(
                    //   child: Container(
                    //       child: controller.store.selectedImage.value == null
                    //           ? const CircleAvatar(
                    //               radius: 40,
                    //               backgroundColor: XColors.xGrey,
                    //             )
                    //           : CircleAvatar(
                    //               radius: 40,
                    //               backgroundImage: FileImage(File(
                    //                   controller.store.selectedImage.value!)),
                    //             )),
                    // ),
                    // gapH16,
                    // Button.primary(
                    //     color: XColors.primary,
                    //     onPressed: () {
                    //       controller.pickImageGallery();
                    //     },
                    //     child: Text(
                    //       'gallery',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .bodyText2Bold
                    //           ?.copyWith(
                    //             color: Colors.white,
                    //           ),
                    //     )),
                    // gapH16,
                    // Button.primary(
                    //     color: XColors.primary,
                    //     onPressed: () {
                    //       controller.captureImage();
                    //     },
                    //     child: Text(
                    //       'Capture',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .bodyText2Bold
                    //           ?.copyWith(
                    //             color: Colors.white,
                    //           ),
                    //     )),
                    gapH16,
                    MTextField(
                      borderRadius: 10,
                      borderColor:XColors.xGrey.shade700,
                      filledColor: XColors.xPink[350],
                      fieldData: controller.nameFieldData,
                      hintText: 'Name',
                    ),
                    gapH16,
                    MTextField(
                      borderRadius: 10,
                      borderColor:XColors.xGrey.shade700,
                      filledColor: XColors.xPink[350],
                      fieldData: controller.emailFieldData,
                      hintText: 'Email',
                    ),
                    gapH16,
                    MTextField(
                      borderRadius: 10,
                      borderColor:XColors.xGrey.shade700,
                      filledColor: XColors.xPink[350],
                      fieldData: controller.passwordFieldData,
                      hintText: 'Password',
                    ),
                    gapH16,
                    MTextField(
                      borderRadius: 10,
                      borderColor:XColors.xGrey.shade700,
                      filledColor: XColors.xPink[350],
                      fieldData: controller.numberFieldData,
                      hintText: 'Phone',
                    ),
                    gapH32,
                    Button.primary(
                      borderRadius: 10,
                      color: XColors.xPink[650],
                      onPressed: controller.onActionLoginClicked,
                      child: const Text(NameConstant.kSignUp),
                    ),
                    gapH32,
                    Align(
                      child: AlreadyAcount(
                        clickActionHandle: controller.onSignInClicked,
                      ),
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: 24),
            ],
          ),
        ),
      ),
    );
  }
}
