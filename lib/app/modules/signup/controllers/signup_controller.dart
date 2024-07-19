import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../mixins/loading_mixin.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/validators.dart';
import '../../../widgets/snack_bar.dart';
import '../../../widgets/x_text_field.dart';
import '../store/store.dart';

class SignupController extends GetxController with LoadingMixin {
    SignupController({required this.store});

    final SignUpStore store;

  final formKeySignUp = GlobalKey<FormState>();
final nameFieldData = TextFieldData(
    validator: Validator.alphanumericNotEmptyValidator,
    keyboardType: TextInputType.name,
  );

  final emailFieldData = TextFieldData(
    validator: Validator.emailValidator,
    keyboardType: TextInputType.emailAddress,
  );

  final passwordFieldData =
      TextFieldData(validator: Validator.passwordValidator, isPassword: true);
  
  final numberFieldData =
      TextFieldData(validator: Validator.phoneNumberFormatValidator);
  
  void onSignInClicked() => Get.offAllNamed(Routes.LOGIN);

  Future<void> onActionLoginClicked() async {
    if (!formKeySignUp.currentState!.validate()) {
      return;
    }
    if(store.selectedImage.value == null){
      showErrorSnackbar(message: 'Please select photo');
      return;
    }
    loading.value = true;
    Future.delayed(const Duration(seconds: 3),(){


    Get.offNamed(Routes.LOGIN);
    loading.value = false;
    });
    
  }
Future pickImageGallery() async{
  final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(returnedImage !=null){
    store.selectedImage.value = returnedImage.path;
  }
}
Future captureImage() async{
  final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  if(returnedImage !=null){
    store.selectedImage.value = returnedImage.path;
  }
}
}
