import 'package:flutter/material.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/colors.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/utils.dart';
import 'package:flutter_app/ui/views/splash_view/splash_controller.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
        child: Stack(
          children: [
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
                child: ListView(shrinkWrap: true, children: [
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
            ]))
          ],
        ),
      ),
    );
  }
}
