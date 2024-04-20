import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/shared/colors.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/utils.dart';
import 'package:flutter_app/ui/views/chat_view/chat_view.dart';
import 'package:flutter_app/ui/views/edit_student_profile_view/edit_student_profile_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeStudentView extends StatelessWidget {
  const HomeStudentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircularContainer(
                    Icons.message, () => Get.to(ChatView())),
                _buildCircularContainer(Icons.photo, () => Get.to(ChatView())),
                _buildCircularContainer(
                    Icons.person, () => Get.to(EditStudentProfileView())),
              ],
            ),

            // Row 2
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircularContainer(
                    CustomText(
                        text: 'States i have', textColor: AppColors.whiteColor),
                    () => Get.to(ChatView())),
                _buildCircularContainer(
                    CustomText(
                      text: 'States i want',
                      textColor: AppColors.whiteColor,
                    ),
                    () => Get.to(ChatView())),
                _buildCircularContainer(
                    Icons.question_mark, () => Get.to(ChatView())),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularContainer(dynamic content, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth(3.5),
        height: screenHeight(5),
        decoration: BoxDecoration(
          color: AppColors.blueColorTwo,
          shape: BoxShape.circle,
        ),
        child: content is IconData
            ? Icon(content, size: screenWidth(5), color: AppColors.whiteColor)
            : (content is String || content is CustomText)
                ? Center(child: content)
                : throw FlutterError(
                    "Invalid content type passed to _buildCircularContainer. "
                    "Expected IconData, String, or CustomText, but got ${content.runtimeType}."),
      ),
    );
  }
}
