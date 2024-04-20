import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/textfield_type.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_app/ui/views/chat_view/chat_view.dart';
import 'package:flutter_app/ui/views/edit_student_profile_view/edit_student_profile_view.dart';
import 'package:flutter_app/ui/views/messages_view/messages_view.dart';
import 'package:flutter_app/ui/views/sign_up_user_view/sign_up_user_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/data/models/token_info.dart';
import '../../shared/colors.dart';
import '../../shared/utils.dart';
import '../determine_the_status_view/determine_the_status_view.dart';
import '../edit_user_profile_view/edit_user_profile_view.dart';
import '../know_the_status_view/know_the_status_view.dart';
import '../login_doctor_view/login_doctor_view.dart';
import '../login_user_view/login_user_view.dart';
import '../otp_code_view/otp_code_view.dart';

class HomeUserView extends StatelessWidget {
  HomeUserView({super.key});
  List<String> list = [
    "معلوماتي الشخصية",
    "الرسائل",
    "معرفة حالتي",
    "تحديد الحالة",
    "الأطباء في محافظتك",
    "الأطباء في غير محافظتك",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: screenWidth(20), top: screenHeight(20)),
            child: TextButton(
              child:
                  Text(Get.locale!.languageCode == 'ar' ? 'English' : 'عربي'),
              onPressed: () {
                // Update locale based on current language
                final newLocale = Get.locale!.languageCode == 'ar'
                    ? Locale('en', '')
                    : Locale('ar', '');
                Get.updateLocale(newLocale);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/pngs/under_image.png",
              width: screenWidth(1),
              height: screenWidth(1.8),
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: screenWidth(2.5),
                  left: screenWidth(30),
                  right: screenWidth(30)),
              child: CustomButton(
                onPress: () {},
                fontSize: screenWidth(27),
                title:
                    "نصائح مفيدة للحفاظ على أسنان جميلة مثل الصورة في الأسفل    ",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight(10),
                bottom: screenWidth(1.71),
                right: screenWidth(30),
                left: screenWidth(30)),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: screenWidth(20),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      mainAxisSpacing: screenWidth(30),
                      crossAxisSpacing: screenWidth(10)),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (list[index] == "معلوماتي الشخصية")
                          Get.to(() => EditUserProfileView());
                        if (list[index] == "الرسائل") Get.to(() => ChatView());
                        if (list[index] == "معرفة حالتي")
                          Get.to(() => KnowTheStatusView());
                        if (list[index] == "تحديد الحالة")
                          Get.to(() => DetermineTheStatusView());
                        if (list[index] == "الأطباء في محافظتك")
                          Get.to(() => OtpCodeView());
                        if (list[index] == "الأطباء في غير محافظتك")
                          Get.to(() => LoginUserView());
                      },
                      child: Container(
                        padding: EdgeInsets.all(screenWidth(40)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: screenWidth(screenWidth(1)),
                                color: AppColors.blackColor),
                            color: AppColors.blueColorTwo,
                            borderRadius: BorderRadius.circular(30)),
                        width: screenWidth(2),
                        height: screenWidth(4),
                        child: Center(
                            child: CustomText(
                          max_lines: 1,
                          text: list[index],
                          styleType: TextStyleType.CUSTOM,
                          fontSize: screenWidth(27),
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: screenWidth(20),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: screenWidth(10),
                        right: screenWidth(10),
                        bottom: screenHeight(20)),
                    padding: EdgeInsets.all(screenWidth(40)),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: screenWidth(screenWidth(1)),
                            color: AppColors.blackColor),
                        color: AppColors.blueColorTwo,
                        borderRadius: BorderRadius.circular(30)),
                    width: screenWidth(3),
                    height: screenWidth(4.5),
                    child: Center(
                        child: CustomText(
                      max_lines: 1,
                      text: "تحليل صور البانورامية بالذكاء الأصطناعي ",
                      styleType: TextStyleType.CUSTOM,
                      fontSize: screenWidth(27),
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
