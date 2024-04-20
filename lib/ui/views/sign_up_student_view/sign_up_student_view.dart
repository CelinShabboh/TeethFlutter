import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/textfield_type.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_app/ui/views/sign_up_student_view/sign_up_student_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/utils.dart';
import '../login_doctor_view/login_doctor_view.dart';

class SignUpStudentView extends StatelessWidget {
  SignUpStudentView({super.key});
  SignUpStudentController controller = Get.put(SignUpStudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
          height: screenHeight(1),
          width: screenWidth(1),
          child: Form(
            key: controller.formKey,
            child: Obx(
              () => controller.isLoading.value
                  ? SpinKitCircle(
                      color: AppColors.blackColor,
                    )
                  : Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenWidth(10),
                            left: screenWidth(25),
                            right: screenWidth(25)),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: screenWidth(13),
                            ),
                            CustomText(
                              text: " ! " + tr("welcome"),
                              styleType: TextStyleType.TITLE,
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomText(
                              text: " ! " + tr("create_account_at_app"),
                              styleType: TextStyleType.SUBTITLE,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomText(
                              text: tr("email"),
                              styleType: TextStyleType.SUBTITLE,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomTextField(
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return tr('please_enter_email');
                                  else if (!isEmailValid(value))
                                    return tr('please_enter_valid_email');
                                  else
                                    return null;
                                },
                                controller: controller.emailController,
                                hintText: tr("email"),
                                typeOfTextField: TypeOfTextField.NORMAL,
                                obscureStatus: false),
                            SizedBox(
                              height: screenWidth(10),
                            ),
                            CustomText(
                              text: tr("first_name"),
                              styleType: TextStyleType.SUBTITLE,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomTextField(
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return tr('please_enter_your_name');
                                  else
                                    return null;
                                },
                                controller: controller.nameController,
                                hintText: tr("first_name"),
                                typeOfTextField: TypeOfTextField.NORMAL,
                                obscureStatus: false),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomText(
                              text: tr("spetial code"),
                              styleType: TextStyleType.SUBTITLE,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            // CustomTextField(
                            //     validator: (value) {
                            //       if (value!.isEmpty)
                            //         return tr('please_enter_last_name');
                            //       else
                            //         return null;
                            //     },
                            //     controller: controller.lastNameController,
                            //     hintText: tr("last_name"),
                            //     typeOfTextField: TypeOfTextField.NORMAL,
                            //     obscureStatus: false),
                            // SizedBox(
                            //   height: screenWidth(25),
                            // ),
                            CustomTextField(
                                validator: (value) {
                                  if (value != 'FTY-Dentist')
                                    return tr('please_enter_your_code');
                                  else
                                    return null;
                                },
                                hintText: tr("xxx-xxxxxxx"),
                                typeOfTextField: TypeOfTextField.NORMAL,
                                obscureStatus: false),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomText(
                              text: tr("phone"),
                              styleType: TextStyleType.SUBTITLE,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomTextField(
                                validator: (value) {},
                                controller: controller.phoneController,
                                textInputType: TextInputType.number,
                                hintText: "999-999-999",
                                typeOfTextField: TypeOfTextField.NORMAL,
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
                            Obx(() => Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.blackColor),
                                      color: AppColors.blueColorOne),
                                  child: DropdownButton<String>(
                                    padding: EdgeInsets.all(screenWidth(40)),
                                    underline: SizedBox(),
                                    value: controller.selectedGovernorate.value,
                                    onChanged: (String? newValue) {
                                      controller.selectedGovernorate.value =
                                          newValue!;
                                    },
                                    items: controller.governorateNames
                                        .map((String governorate) {
                                      return DropdownMenuItem<String>(
                                        value: governorate,
                                        child: Text(governorate),
                                      );
                                    }).toList(),
                                  ),
                                )),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            // CustomText(
                            //   text: tr("confirm_password"),
                            //   styleType: TextStyleType.SUBTITLE,
                            //   fontWeight: FontWeight.normal,
                            // ),
                            // SizedBox(
                            //   height: screenWidth(25),
                            // ),
                            // Obx(() => CustomTextField(
                            //     validator: (value) {
                            //       if (value!.isEmpty)
                            //         return tr('please_confirm_your_password');
                            //       else if (!(value ==
                            //           controller.passwordController.text))
                            //         return tr('password_not_complete_match');
                            //       else
                            //         return null;
                            //     },
                            //     controller:
                            //         controller.confirmPasswordController,
                            //     onPressVisibleIcon: () {
                            //       controller.showPassword.value =
                            //           !controller.showPassword.value;
                            //     },
                            //     hintText: tr("confirm_password"),
                            //     typeOfTextField: TypeOfTextField.PASSWORD,
                            //     obscureStatus: controller.showPassword.value)),
                            CustomText(
                              text: tr("university"),
                              styleType: TextStyleType.SUBTITLE,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            Obx(() => Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.blackColor),
                                      color: AppColors.blueColorOne),
                                  child: DropdownButton<String>(
                                    padding: EdgeInsets.all(screenWidth(40)),
                                    underline: SizedBox(),
                                    value: controller.selectedUniversity.value,
                                    onChanged: (String? newValue) {
                                      controller.selectedUniversity.value =
                                          newValue!;
                                    },
                                    items: controller.universityNames
                                        .map((String university) {
                                      return DropdownMenuItem<String>(
                                        value: university,
                                        child: Text(university),
                                      );
                                    }).toList(),
                                  ),
                                )),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomText(
                              text: tr("collage_year"),
                              styleType: TextStyleType.SUBTITLE,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            Obx(() => Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.blackColor),
                                      color: AppColors.blueColorOne),
                                  child: DropdownButton<String>(
                                    padding: EdgeInsets.all(screenWidth(40)),
                                    underline: SizedBox(),
                                    value: controller.selectedCollage.value,
                                    onChanged: (String? newValue) {
                                      controller.selectedCollage.value =
                                          newValue!;
                                    },
                                    items: controller.collageNames
                                        .map((String collage) {
                                      return DropdownMenuItem<String>(
                                        value: collage,
                                        child: Text(collage),
                                      );
                                    }).toList(),
                                  ),
                                )),
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
                            Obx(() => CustomTextField(
                                validator: (value) {
                                  if (!isComplexPassword(value!))
                                    return tr('please_enter_valid_password');
                                  else
                                    return null;
                                },
                                controller: controller.passwordController,
                                onPressVisibleIcon: () {
                                  controller.showPassword.value =
                                      !controller.showPassword.value;
                                },
                                hintText: tr("password"),
                                typeOfTextField: TypeOfTextField.PASSWORD,
                                obscureStatus: controller.showPassword.value)),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomButton(
                              onPress: () async {
                                await controller.signUp();
                              },
                              title: tr("create_account"),
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            InkWell(
                              onTap: () {
                                Get.off(() => LoginDoctorView());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText(
                                    text: tr("have_account") + " ? ",
                                    styleType: TextStyleType.BODY,
                                    textColor: AppColors.grayColorOne,
                                  ),
                                  CustomText(
                                    text: tr("login"),
                                    styleType: TextStyleType.BODY,
                                    textColor: AppColors.blackColor,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenWidth(10),
                            )
                          ],
                        ),
                      )
                    ]),
            ),
          ),
        ));
  }
}
