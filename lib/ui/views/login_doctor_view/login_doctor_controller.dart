import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/data/repository/auth_repository.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_app/ui/shared/utils.dart';
import 'package:flutter_app/ui/views/home_user_view/home_user_view.dart';
import 'package:flutter_app/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

import '../../../core/data/models/token_info.dart';
import '../../../core/data/repository/shared_prefrence_repository.dart';
import '../home_student_view/home_student_view.dart';

class LoginDoctorController extends GetxController {
  RxBool rememebrMe = false.obs;
  RxBool showPassword = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  bool haveWrong = false;
  @override
  void onInit() {
    isSaved();
    super.onInit();
  }

  isSaved() {}

  login() async {
    // if (!isOnline) {
    //   CustomToast.showMeassge(message: tr("key_no_internet"));
    //   return;
    // }

    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      AuthRepository()
          .login(email: emailController.text, password: passwordController.text)
          .then((value) {
        isLoading.value = false;
        value.fold((l) {
          print(l);
        }, (r) {
          print(r);
          storage.settoken(r);
          Get.offAll(HomeStudentView());
        });
      });
    }
  }
}
