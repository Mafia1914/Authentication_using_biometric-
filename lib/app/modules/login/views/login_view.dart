import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../../../widgets/button.dart';
import '../../../widgets/x_loading_overlay.dart';
import '../../../widgets/x_text_field.dart';
import '../controllers/auth_services_biometric .dart';
import '../controllers/login_controller.dart';
import '../widgets/create_account.dart';
import '../widgets/forgot_password.dart';


class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    gapH16,
                    Text(
                      NameConstant.backText,
                      style: Get.textTheme.titleLarge?.copyWith(
                        color: XColors.xBlack,
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    gapH40,
                    MTextField(
                      borderColor: XColors.xGrey.shade700,
                      filledColor: XColors.xPink[350],
                      fieldData: controller.emailFieldData,
                      hintText: 'Email',
                      borderRadius: 10,
                    ),
                    gapH40,
                    MTextField(
                      filledColor: XColors.xPink[350],
                      fieldData: controller.passwordFieldData,
                      hintText: 'Password',
                      borderColor: XColors.xGrey.shade700,
                      borderRadius: 14,
                    ),
                    gapH12,
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        NameConstant.forText,
                        style: Get.textTheme.titleLarge?.copyWith(
                          color: XColors.xPink[650],
                          fontSize: 16,
                        ),
                      ),
                    ),
                    gapH32,
                    Button.primary(
                      borderRadius: 10,
                      color: XColors.xPink[650],
                      onPressed: controller.onActionLoginClicked,
                      child: Text(
                        NameConstant.kLogin,
                        style: Get.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    gapH32,
                    Align(
                      child: CreateAcount(
                        clickActionHandle: controller.onSignUpClicked,
                      ),
                    ),
                    gapH16,
                    Align(
                      child: ForgotPassword(
                        clickActionHandle: controller.onForgotPasswordClicked,
                      ),
                    ),
                    gapH16,

                    const SizedBox(height: 20,),
                    const Text("Click button to login with Biometrics"),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: () async {
                        bool isAuthenticated = await AuthService.authenticateUser();
                        if (isAuthenticated) {
                          // ignore: use_build_context_synchronously
                          Get.toNamed(Routes.MAIN);
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Authentication failed.'),
                            ),
                          );
                        }
                      },
                      child: Center(
                        child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width ,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent, width: 2.5)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.fingerprint,
                                  color: Colors.blueAccent,
                                ),
                                Text(
                                  "Login with BioMetrics",
                                  style: TextStyle(color: Colors.blueAccent),
                                )
                              ],
                            )),
                      ),
                    )
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

