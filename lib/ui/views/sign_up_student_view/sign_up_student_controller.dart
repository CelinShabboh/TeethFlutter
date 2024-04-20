import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/data/models/user_info.dart';
import 'package:flutter_app/core/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../../../core/translation/app_translation.dart';
import '../login_doctor_view/login_doctor_view.dart';
import '../home_user_view/home_user_view.dart';

class SignUpStudentController extends GetxController {
  RxBool rememebrMe = false.obs;
  RxBool showPassword = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var selectedUniversity = 'albath'.obs;
  var selectedCollage = 'five'.obs;
  var selectedGovernorate = 'damascus'.obs;

  List<String> universityNames = [
    'damas',
    'tartus',
    'tushren',
    'albath',
  ];
  List<String> governorateNames = [
    'damascus',
    'homs',
    'hama',
    'tartus',
    'latakia',
  ];
  List<String> collageNames = [
    'four',
    'five',
  ];

  RxBool isLoading = false.obs;
  bool haveWrong = false;
  final authRepository = AuthRepository();
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await AuthRepository()
          .signUp(
              email: emailController.text,
              name: nameController.text,
              phone: phoneController.text,
              governorate: selectedGovernorate.value,
              university: selectedUniversity.value,
              collegeyear: selectedCollage.value,
              password: passwordController.text)
          .then((value) {
        isLoading.value = false;
        value.fold((l) {
          BotToast.showText(text: l);
          print(l);
        }, (r) {
          Get.off(LoginDoctorView());
        });
      });
      //.then((value) => value.fold((l) => haveWrong = true, (r) => null));
      // isLoading.value = false;
      // if (haveWrong) {
      //   BotToast.showText(text: tr('invalid_username_or_password'));
      // } else {
      //   print(true);

      //   Get.off(LoginView());
      // }
    }
  }
}
