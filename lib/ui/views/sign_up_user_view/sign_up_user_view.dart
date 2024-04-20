import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/textfield_type.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/colors.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_app/ui/shared/utils.dart';
import 'package:flutter_app/ui/views/sign_up_user_view/sign_up_user_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../login_user_view/login_user_view.dart';

class SignUpUserView extends StatelessWidget {
  SignUpUserView({super.key});
  SignUpUserController controller = Get.put(SignUpUserController());
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
                      Image.asset(
                        "assets/images/pngs/doctor.png",
                        width: screenWidth(1),
                        height: screenWidth(1),
                        fit: BoxFit.fill,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.ContainerTextFieldColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50))),
                        margin: EdgeInsets.only(
                          top: screenWidth(1.1),
                        ),
                        padding: EdgeInsets.all(screenWidth(20)),
                        width: screenWidth(1),
                        height: screenHeight(1),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            CustomText(
                              text: tr("name"),
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
                                hintText: tr("name"),
                                typeOfTextField: TypeOfTextField.NORMAL,
                                obscureStatus: false),
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
                            // CustomText(
                            //   text: tr("key_confirm_password"),
                            //   styleType: TextStyleType.SUBTITLE,
                            //   fontWeight: FontWeight.normal,
                            // ),
                            // SizedBox(
                            //   height: screenWidth(25),
                            // ),
                            // Obx(() => CustomTextField(
                            //     validator: (value) {
                            //       if (value!.isEmpty)
                            //         return tr(
                            //             'key_please_confirm_your_password');
                            //       else if (!(value ==
                            //           controller.passwordController.text))
                            //         return tr(
                            //             'key_password_not_complete_match');
                            //       else
                            //         return null;
                            //     },
                            //     controller:
                            //         controller.confirmPasswordController,
                            //     onPressVisibleIcon: () {
                            //       controller.showPassword.value =
                            //           !controller.showPassword.value;
                            //     },
                            //     hintText: tr("key_confirm_password"),
                            //     typeOfTextField: TypeOfTextField.PASSWORD,
                            //     obscureStatus: controller.showPassword.value)),
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
                                Get.off(() => LoginUserView());
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
