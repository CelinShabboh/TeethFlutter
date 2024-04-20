import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_Home_button.dart';
import '../../shared/utils.dart';
import '../main_view/main_view.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
        child: ListView(
          children: [
            Center(
              child: CustomText(
                text:
                    '\n                    الحالة الأولى:مداواة ترميمية محافظة\n                         (حشوات بدون سحب عصب)\nهي أي نخر طفيف بالسن بدون وجود ألم عفوي(ألم بدون مسبب)\n         أي حصر عند وجود مسبب مثل شرب الماء فرضا \n                      أي يزول الألم عند زوال المسبب\n                      الحالات الموجودة من 1 الى 6',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(24),
              ),
            ),
            Image.asset(
              "assets/images/pngs/classes.png",
              height: screenWidth(0.9),
            ),
            Center(
              child: CustomText(
                text:
                    '\n                   الحالة الثانية\n    قلع أسنان أمامية و مؤقتة للأطفال\nعبارة عن أي سن يهتز أمامي وبدو قلع ',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
              ),
            ),
            Center(
              child: CustomText(
                text:
                    '\n\nالحالة الثالثة:تعويضات أسنان متحركة\n   قلع أسنان أمامية و مؤقتة للأطفال\nعبارة عن أي سن يهتز أمامي وبدو قلع',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/pngs/kennedy.png",
                  height: screenWidth(3),
                ),
                Image.asset(
                  "assets/images/pngs/type.png",
                  height: screenWidth(3),
                ),
              ],
            ),
            Center(
              child: CustomText(
                text: '\nالحالة الرابعة:لثة(تنظيف لثة تقليح)\n',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
              ),
            ),
            Center(
              child: CustomText(
                text: 'خفيفة',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Image.asset(
              "assets/images/pngs/light.png",
              height: screenWidth(3),
            ),
            Center(
              child: CustomText(
                text: 'متوسطة',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Image.asset(
              "assets/images/pngs/medium.png",
              height: screenWidth(3),
            ),
            Center(
              child: CustomText(
                text: 'شديدة',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Image.asset(
              "assets/images/pngs/severe.png",
              height: screenWidth(3),
            ),
            Center(
              child: CustomText(
                text:
                    '\nالحالة الخامسة:معاجة أطفال حشوات بتر\n              (سحب عصب جزئي)\nالحالة السادسة : تركيب تاج ستانلس ستيل\n           نفس الصورة تهدم في السن',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Image.asset(
              "assets/images/pngs/demolition.png",
              height: screenWidth(3),
            ),
            Center(
              child: CustomText(
                text: '\nشكل التاج بعدالتركيب',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Image.asset(
              "assets/images/pngs/installation.png",
              height: screenWidth(3),
            ),
            Center(
              child: CustomText(
                text:
                    '\nالحالة السابعة:بدلة كاملة (فك علوي وسفلي حصرا)\n                     فقدان جميع الأسنان\nتحتاج صورة بانوراما أفضل لاختيار شكل البدلة\n                 شكل البدلة المراد تركيبها',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
              ),
            ),
            Image.asset(
              "assets/images/pngs/suit.png",
              height: screenWidth(3),
            ),
            Center(
              child: CustomText(
                text:
                    '\nالحالة الثامنة:تطبيق فلور أو سادات (للوقاية)\n      أي طفل لديك بحاجة لها مجرد وقاية',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/pngs/protection1.png",
                  height: screenWidth(3),
                ),
                Image.asset(
                  "assets/images/pngs/protection2.png",
                  height: screenWidth(3),
                ),
              ],
            ),
            Center(
              child: CustomText(
                text:
                    '\n            أي حالة اهتزاز في السن ويحتاج الى قلع\n            أي حالة اهتزاز في السن ويحتاج الى قلع\n        الحالة العاشرة :مداواة لبية (سحب عصب كامل)\n                       (عصب ملتهب مؤلم مزعج)\n            في حال كان يوجد ألم بالسن عند  البرودة \n                              أي شرب الماء البارد\n           أو تناول الحلويات أو ألم عفوي يزداد ليلا\n                                 وعند الاستلقاء\nالحالة العاشرة:عصب ميت ظهور خراج أو احتمال ظهور خراج\n            في حال كان يوجد ألم بالسن عند  الحرارة\n                       أو عند المضغ أو يوجد خراج\nالحالة الحادية عشر: جسر خلفي فقد سن أو سنين حصرا\n            في الصورة الأسفل فقد سن خلفي واحد',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(22),
              ),
            ),
            Image.asset(
              "assets/images/pngs/lose.png",
              height: screenWidth(3),
            ),
            Center(
              child: CustomText(
                text:
                    'الحالة الثانية عشر :قلع أسنان خلفية حصرا وأضراس العقل\n          أي حالة اهتزاز في الضرس ويحتاج الى قلع\n                    أو ألم شديد في ضرس العقل\n            عدد الأسنان 28 سن بدون أضراس العقل\n                         علوية 14 و سفلية 14\n        عدد أضراس العقل 4 ليصبح عدد الأضراس 32 \n                    وهي يتواجدو في نهاية الأسنان\n               أضراس العقل كما موضحة في الصورة',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(22),
              ),
            ),
            Image.asset(
              "assets/images/pngs/brain.png",
              height: screenWidth(3),
            ),
            Center(
              child: CustomText(
                text:
                    'الحالة الثالثة عشر :جسر أمامي ثابت فقد سن أو سنين حصرا\n              في الصورة الأسفل فقد سن أمامي واحد\n                                 يظهر قبل وبعد',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(22),
              ),
            ),
            Image.asset(
              "assets/images/pngs/bridge.png",
              height: screenWidth(3),
            ),
            Center(
              child: CustomText(
                text:
                    'الحالة الثالثة عشر:جراحة فموية قلع سن منطمر\n                  تحتاج صورة بانوراما',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
              ),
            ),
            SizedBox(
              height: screenHeight(18),
            ),
            CustomHomeButton(),
          ],
        ),
      ),
    );
  }
}
