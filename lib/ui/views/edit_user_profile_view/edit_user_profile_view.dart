import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/textfield_type.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_app/ui/views/edit_student_profile_view/edit_student_profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/colors.dart';
import '../../shared/utils.dart';
import 'edit_user_profile_controller.dart';

class EditUserProfileView extends StatelessWidget {
  EditUserProfileView({super.key});
  EditUserProfileController controller = Get.put(EditUserProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(1),
        width: screenWidth(1),
        decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth(30),
                  top: screenWidth(15),
                  left: screenWidth(30)),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: screenWidth(3),
                          height: screenWidth(3),
                          child: Stack(
                            children: [
                              InkWell(
                                  onTap: () {
                                    controller.selectedImage.value == null
                                        ? controller.showOption.value = true
                                        : null;
                                  },
                                  child: Container(
                                    width: screenWidth(3),
                                    height: screenWidth(3),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 2, color: Colors.black),
                                        image: controller.selectedImage.value !=
                                                null
                                            ? DecorationImage(
                                                image: FileImage(controller
                                                    .selectedImage.value!),
                                                fit: BoxFit.cover)
                                            : null),
                                    child:
                                        controller.selectedImage.value == null
                                            ? Icon(Icons.image)
                                            : null,
                                  )),
                              if (controller.selectedImage.value != null)
                                Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: InkWell(
                                    onTap: () {
                                      controller.showOption.value = true;
                                    },
                                    child: Container(
                                      width: screenWidth(10),
                                      height: screenWidth(10),
                                      decoration: BoxDecoration(
                                          color: AppColors.blueColorOne,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Icon(Icons.edit),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        if (controller.showOption.value)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await ImagePicker()
                                      .pickImage(source: ImageSource.camera)
                                      .then(
                                    (value) {
                                      if (value != null) {
                                        controller.selectedImage.value =
                                            File(value.path);
                                        storage.setFilePath(File(value.path));
                                      }
                                    },
                                  );

                                  controller.showOption.value = false;
                                },
                                child: Container(
                                  width: screenWidth(5),
                                  height: screenHeight(20),
                                  decoration: BoxDecoration(
                                    color: AppColors.blueColorOne,
                                    border:
                                        Border.all(color: AppColors.blackColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Camera',
                                      textColor: AppColors.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth(10),
                              ),
                              InkWell(
                                onTap: () async {
                                  await ImagePicker()
                                      .pickImage(source: ImageSource.gallery)
                                      .then(
                                    (value) {
                                      if (value != null) {
                                        controller.selectedImage.value =
                                            File(value.path);
                                        storage.setFilePath(File(value.path));
                                      }

                                      controller.showOption.value = false;
                                    },
                                  );
                                },
                                child: Container(
                                  width: screenWidth(5),
                                  height: screenHeight(20),
                                  decoration: BoxDecoration(
                                    color: AppColors.blueColorOne,
                                    border:
                                        Border.all(color: AppColors.blackColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Gallery',
                                      textColor: AppColors.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: screenWidth(40),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenWidth(25),
                  ),
                  // CustomText(
                  //   text: tr("name"),
                  //   styleType: TextStyleType.SUBTITLE,
                  //   fontWeight: FontWeight.normal,
                  // ),
                  // SizedBox(
                  //   height: screenWidth(25),
                  // ),
                  // CustomTextField(
                  //     hintText: tr("name"),
                  //     typeOfTextField: TypeOfTextField.NORMAL,
                  //     obscureStatus: false),
                  // SizedBox(
                  //   height: screenWidth(25),
                  // ),
                  CustomText(
                    text: tr("phone_number"),
                    styleType: TextStyleType.SUBTITLE,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: screenWidth(25),
                  ),
                  CustomTextField(
                      textInputType: TextInputType.number,
                      hintText: "999-999-999",
                      typeOfTextField: TypeOfTextField.NORMAL,
                      obscureStatus: false),
                  SizedBox(
                    height: screenWidth(25),
                  ),
                  CustomText(
                    text: tr("password"),
                    styleType: TextStyleType.SUBTITLE,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: screenWidth(25),
                  ),
                  CustomTextField(
                      hintText: tr("password"),
                      typeOfTextField: TypeOfTextField.PASSWORD,
                      obscureStatus: false),
                  SizedBox(
                    height: screenWidth(25),
                  ),
                  CustomText(
                    text: tr("governorate"),
                    styleType: TextStyleType.SUBTITLE,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: screenWidth(25),
                  ),
                  CustomTextField(
                      hintText: tr("governorate"),
                      typeOfTextField: TypeOfTextField.NORMAL,
                      obscureStatus: false),
                  SizedBox(
                    height: screenWidth(10),
                  ),
                  CustomButton(
                    onPress: () {},
                    title: tr("save"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
