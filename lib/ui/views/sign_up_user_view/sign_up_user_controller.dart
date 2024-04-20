import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/data/repository/auth_repository.dart';
import 'package:flutter_app/core/data/repository/user_repository.dart';
import 'package:get/get.dart';

import '../../../core/translation/app_translation.dart';
import '../login_user_view/login_user_view.dart';

class SignUpUserController extends GetxController {
  RxBool rememebrMe = false.obs;
  RxBool showPassword = true.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var selectedGovernorate = 'Damascus'.obs;
  List<String> governorateNames = [
   'Damascus',
    'Homs',
    'Hama',
    'Tartus',
    'Latakia',
  ];

  RxBool isLoading = false.obs;
  bool haveWrong = false;
  final authRepository = AuthRepository();
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await UserRepository()
          .UserSignUp(
              name: nameController.text,
              phone: phoneController.text,
              governorate: selectedGovernorate.value,
              password: passwordController.text)
          .then((value) {
        isLoading.value = false;
        value.fold((l) {
          BotToast.showText(text: l);
          print(l);
        }, (r) {
          Get.off(LoginUserView());
        });
      });
      //     .then((value) => value.fold((l) => haveWrong = true, (r) => null));
      // isLoading.value = false;
      // if (haveWrong) {
      //   BotToast.showText(text: tr('invalid_username_or_password'));
      // } else {
      //   print(true);

      //   Get.off(LoginUserView());
      // }
    }
  }
}
