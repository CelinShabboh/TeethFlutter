import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_Home_button.dart';
import '../../shared/custom_widgets/custom_checkbox.dart';
import '../../shared/utils.dart';
import '../main_view/main_view.dart';
import 'determine_the_status_controller.dart';

class DetermineTheStatusView extends StatefulWidget {
  DetermineTheStatusView({super.key});

  @override
  State<DetermineTheStatusView> createState() => _DetermineTheStatusViewState();
}

class _DetermineTheStatusViewState extends State<DetermineTheStatusView> {
  DetermineTheStatusController controller =
      Get.put(DetermineTheStatusController());
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
                    '\nكلما اخترت الحالة الصحيحة\nكلما كانت نتائج بحثك أفضل\n',
                fontSize: screenWidth(15),
                styleType: TextStyleType.CUSTOM,
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            return Checkbox(
                              checkColor: Colors.white,
                              value: controller.isCheckedValues[index],
                              onChanged: (bool? value) {
                                controller.status[index].numberOfTeeths = 0;
                                controller.status[index].numberOfkids = 0;
                                controller.isCheckedValues[index] = value!;
                                // if (value!) {
                                //   selectedIndex = index;
                                // } else {
                                //   selectedIndex = -1;
                                // }
                              },
                            );
                          }),
                          Text(controller.status[index].name!),
                          if (index == 0)
                            CustomCheckbox(
                              counter1: true,
                            ),
                          if (index == 2)
                            CustomCheckbox(
                              divider1: true,
                              counter2: true,
                            ),
                          if (index == 12)
                            CustomCheckbox(
                              class1: true,
                            ),
                          if (index == 13)
                            CustomCheckbox(
                              class2: true,
                            ),
                          if (index == 14)
                            CustomCheckbox(
                              class2: true,
                            ),
                        ],
                      ),
                      if (index == 1)
                        CustomCheckbox(
                          start: screenWidth(9),
                          radio1: true,
                          divider2: true,
                          counter2: true,
                        ),
                      if (index == 4)
                        CustomCheckbox(
                          start: screenWidth(12),
                          radio2: true,
                        ),
                      if (index == 6)
                        CustomCheckbox(
                          start: screenWidth(9),
                          radio3: true,
                          divider2: true,
                          counter2: true,
                        ),
                      if (index == 7)
                        CustomCheckbox(
                          start: screenWidth(9),
                          radio3: true,
                          divider2: true,
                          counter2: true,
                        ),
                      if (index == 8)
                        CustomCheckbox(
                          start: screenWidth(3),
                          class1: true,
                        ),
                      if (index == 9)
                        CustomCheckbox(
                          start: screenWidth(9),
                          class1: true,
                          divider2: true,
                          counter2: true,
                        ),
                      if (index == 10)
                        CustomCheckbox(
                          start: screenWidth(3),
                          class1: true,
                        ),
                      if (index == 11)
                        CustomCheckbox(
                          start: screenWidth(9),
                          radio4: true,
                          divider2: true,
                          counter2: true,
                        ),
                      if (controller.isCheckedValues[index]) Divider(),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: screenWidth(10),
                  );
                },
                itemCount: controller.status.length),
            Container(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/pngs/under_image.png",
                    width: screenWidth(1),
                    height: screenWidth(1.4),
                    fit: BoxFit.fill,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenWidth(18),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        // atLeastOneCheckboxSelected
                        //     ? () => sendInformation()
                        //     : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(25.0),
                          foregroundColor: AppColors.blackColor,
                          side: BorderSide(
                            color: AppColors.blackColor,
                            width: 2.0,
                          ),
                        ),
                        child: CustomText(
                          text: 'أدخل',
                          fontSize: screenWidth(18),
                          textColor: AppColors.blackColor,
                          styleType: TextStyleType.CUSTOM,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(top: screenHeight(4)),
                      child: CustomHomeButton(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
