import 'package:flutter/material.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_app/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class OtpCodeController extends GetxController {
  RxList<String> otpCodes = List<String>.filled(4, '').obs;
  RxBool filledAll = false.obs;
  final List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());
  bool haveWrong = false;
  @override
  void onInit() {
    super.onInit();
  }

  setOtpCode(int index, String code) {
    otpCodes[index] = code;
    int numberCount = 0;
    otpCodes.forEach((element) {
      if (element != '') numberCount++;
    });
    filledAll.value = numberCount == 4;
    numberCount = 0;
  }

  sendCode() async {
    if (!isOnline) {
      CustomToast.showMeassge(message: tr("key_no_internet"));
      return;
    }
    String combinedOTP = otpCodes.join('');
    filledAll.value = false;
    //send code to api
    filledAll.value = true;
  }
}
