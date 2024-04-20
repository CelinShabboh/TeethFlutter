import 'dart:io';

import 'package:flutter_app/ui/shared/utils.dart';
import 'package:get/get.dart';

class EditUserProfileController extends GetxController {
  var selectedImage = Rx<File?>(null);
  RxBool showOption = false.obs;
  void onInit() {
    selectedImage.value = storage.getFilePath();
    super.onInit();
  }
}
