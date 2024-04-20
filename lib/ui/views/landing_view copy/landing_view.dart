import 'package:flutter/material.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/views/landing_view%20copy/landing_controller.dart';
import 'package:flutter_app/ui/views/main_view/main_view.dart';
import 'package:flutter_app/ui/views/sign_up_student_view/sign_up_student_view.dart';
import 'package:flutter_app/ui/views/sign_up_user_view/sign_up_user_view.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/utils.dart';
import '../home_user_view/home_user_view.dart';

class landingView extends StatefulWidget {
  landingView({super.key});

  @override
  State<landingView> createState() => _landingViewState();
}

class _landingViewState extends State<landingView> {
  LandingController controller = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenHeight(20), start: screenWidth(20)),
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
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: screenWidth(4)),
                  child: CustomText(
                    text: tr("hello"),
                    styleType: TextStyleType.TITLE,
                  ),
                )),
            Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    width: screenWidth(1.2),
                    height: screenWidth(1.2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/images/pngs/teath.png",
                        ))),
                  ),
                  SizedBox(
                    height: screenWidth(10),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth(40),
                      ),
                      Expanded(
                        child: CustomButton(
                          onPress: () {
                            Get.to(() => SignUpStudentView());
                          },
                          title: tr("student"),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(40),
                      ),
                      Expanded(
                        child: CustomButton(
                          onPress: () {
                            Get.to(() => SignUpUserView());
                          },
                          title: tr("sick"),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(40),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
