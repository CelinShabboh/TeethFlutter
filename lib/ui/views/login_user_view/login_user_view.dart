import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/textfield_type.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/colors.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_app/ui/shared/utils.dart';
import 'package:flutter_app/ui/views/login_doctor_view/login_doctor_controller.dart';
import 'package:flutter_app/ui/views/sign_up_user_view/sign_up_user_controller.dart';
import 'package:flutter_app/ui/views/sign_up_user_view/sign_up_user_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'login_user_controller.dart';

class LoginUserView extends StatelessWidget {
  LoginUserView({super.key});
  LoginUserController controller = Get.put(LoginUserController());
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
                              text: tr("welcome_back"),
                              styleType: TextStyleType.TITLE,
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomText(
                              text: tr("login_with_account"),
                              styleType: TextStyleType.SUBTITLE,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: screenWidth(10),
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
                                controller: controller.phoneController,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return tr('please_enter_phone');
                                  else if (!isPhoneValid(value))
                                    return tr('please_enter_valid_phone');
                                  else
                                    return null;
                                },
                                hintText: tr("phone"),
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
                            Obx(
                              () => CustomTextField(
                                  controller: controller.passwordController,
                                  validator: (value) {
                                    if (!isComplexPassword(value!))
                                      return tr(
                                          'please_enter_valid_password');
                                    else
                                      return null;
                                  },
                                  onPressVisibleIcon: () {
                                    controller.showPassword.value =
                                        !controller.showPassword.value;
                                  },
                                  hintText: tr("password"),
                                  typeOfTextField: TypeOfTextField.PASSWORD,
                                  obscureStatus: controller.showPassword.value),
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => Container(
                                    height: screenWidth(10),
                                    width: screenWidth(10),
                                    child: Checkbox(
                                      checkColor: AppColors.whiteColor,
                                      activeColor: AppColors.blackColor,
                                      value: controller.rememebrMe.value,
                                      onChanged: (value) {
                                        controller.rememebrMe.value = value!;
                                      },
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: tr("rememebr_me"),
                                  styleType: TextStyleType.CUSTOM,
                                  fontSize: screenWidth(30),
                                  fontWeight: FontWeight.bold,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    //  Get.to(() => ForgetPasswordView());
                                  },
                                  child: CustomText(
                                    text: tr("forgot_password") + " ?",
                                    styleType: TextStyleType.CUSTOM,
                                    fontSize: screenWidth(30),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            CustomButton(
                              onPress: () async {
                                await controller.user_login();
                              },
                              title: tr("login"),
                            ),
                            SizedBox(
                              height: screenWidth(25),
                            ),
                            InkWell(
                              onTap: () {
                                Get.off(() => SignUpUserView());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText(
                                    text: tr("dont_have_account") + " ? ",
                                    styleType: TextStyleType.BODY,
                                    textColor: AppColors.grayColorOne,
                                  ),
                                  CustomText(
                                    text: tr("sign_up"),
                                    styleType: TextStyleType.BODY,
                                    textColor: AppColors.blackColor,
                                  )
                                ],
                              ),
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
