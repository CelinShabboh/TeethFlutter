import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/views/know_the_status_view/status_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_Home_button.dart';
import '../../shared/utils.dart';
import '../main_view/main_view.dart';

class KnowTheStatusView extends StatefulWidget {
  const KnowTheStatusView({super.key});

  @override
  State<KnowTheStatusView> createState() => _KnowTheStatusViewState();
}

class _KnowTheStatusViewState extends State<KnowTheStatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
        child: ListView(
          children: [
            Image.asset(
              "assets/images/pngs/dentist.png",
            ),
            Center(
              child: CustomText(
                text:
                    '                   مرحبا بك في قسم معرفة حالتي\n                   أنا هنا لمساعدتك لمعرفة حالتك\n          ساعدنا بمعرفة الحالة الصحيحة التي لديك\n             لكي نساعدك بإيجاد الطبيب المناسب لك\nنقدم لك شرحا بسيطا مدعوما بالصور لمعرفة حالتك بسهولة\n                 في حال كان لديك صورة بانورامية \n                           يمكنك مراجعة قسم',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(22),
              ),
            ),
            Center(
              child: CustomText(
                text: 'تحليل صور البانورامية بالذكاء الأصطناعي',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
                textColor: AppColors.redColor,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => StatusView());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16.0),
                foregroundColor: AppColors.blackColor,
                side: BorderSide(
                  color: AppColors.blackColor,
                  width: 2.0,
                ),
              ),
              child: Icon(
                Icons.arrow_back,
                size: screenWidth(7),
              ),
            ),
            SizedBox(
              height: screenHeight(30),
            ),
            CustomHomeButton(),
          ],
        ),
      ),
    );
  }
}
