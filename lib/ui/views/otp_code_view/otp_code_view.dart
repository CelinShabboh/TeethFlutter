import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/colors.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/utils.dart';
import 'package:flutter_app/ui/views/otp_code_view/otp_code_controller.dart';
import 'package:get/get.dart';

final inputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey.shade400),
);

final inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: screenWidth(9)),
  border: inputBorder,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
);

class OtpCodeView extends StatelessWidget {
  OtpCodeView({super.key});
  OtpCodeController controller = Get.put(OtpCodeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screenWidth(1),
        height: screenHeight(1),
        decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: screenWidth(10),
                    left: screenWidth(25),
                    right: screenWidth(25)),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth(5),
                    ),
                    CustomText(
                      text: "Verification",
                      styleType: TextStyleType.TITLE,
                    ),
                    SizedBox(
                      height: screenWidth(25),
                    ),
                    CustomText(
                      max_lines: 2,
                      text: "Enter the verification code sent to your email",
                      styleType: TextStyleType.BODY,
                    ),
                    SizedBox(
                      height: screenWidth(15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(4, (index) {
                          return SizedBox(
                            width: screenWidth(5.8),
                            height: screenWidth(5.8),
                            child: TextFormField(
                              controller: controller.controllers[index],
                              style: TextStyle(
                                  fontSize: screenWidth(26),
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.blueColorOne,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: screenWidth(9)),
                                border: inputBorder,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.blackColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.blackColor),
                                ),
                              ),
                              onChanged: (value) {
                                controller.setOtpCode(index, value);
                                if (value.isNotEmpty && index < 3) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          );
                        })
                      ],
                    ),
                    SizedBox(
                      height: screenWidth(10),
                    ),
                    CustomButton(
                      backColor: AppColors.blueColorOne,
                      title: "send",
                      onPress: () {},
                    ),
                    SizedBox(
                      height: screenWidth(15),
                    ),
                  ],
                )))
          ],
        ),
      ),
    );
  }
}
