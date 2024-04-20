import 'package:flutter/material.dart';
import 'package:flutter_app/ui/shared/colors.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/utils.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: screenWidth(10),
                        left: screenWidth(30),
                        right: screenWidth(30)),
                    height: screenWidth(5),
                    child: Row(
                      children: [
                        Container(
                          height: screenWidth(6),
                          width: screenWidth(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: screenWidth(100),
                                color: AppColors.blueColorThree),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(50),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(text: "osama alnoufy"),
                            SizedBox(
                              height: screenWidth(100),
                            ),
                            CustomText(text: "اخر ظهور ساعة 5 م")
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.video_call,
                          color: AppColors.blueColorThree,
                          size: screenWidth(12),
                        ),
                        SizedBox(
                          width: screenWidth(40),
                        ),
                        Icon(
                          Icons.call,
                          color: AppColors.blueColorThree,
                          size: screenWidth(12),
                        ),
                        SizedBox(
                          width: screenWidth(40),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: AppColors.blueColorThree,
                          size: screenWidth(12),
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: screenWidth(1),
                      height: 1,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: screenWidth(
                        screenWidth(1),
                      )))))
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(screenWidth(50)),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: screenWidth(6.5),
                        width: screenWidth(1),
                        padding: EdgeInsets.all(screenWidth(30)),
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_emotions,
                              color: AppColors.blueColorThree,
                            ),
                            Expanded(
                              child: TextField(
                                textInputAction: TextInputAction.send,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 20.0,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Aa"),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/pngs/files.png",
                                width: screenWidth(15),
                                height: screenWidth(15),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth(35),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/pngs/camera.png",
                                width: screenWidth(15),
                                height: screenWidth(15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(50),
                    ),
                    Container(
                      width: screenWidth(6),
                      height: screenWidth(6.5),
                      padding: EdgeInsets.all(screenWidth(20)),
                      decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/images/pngs/voice.png",
                        width: screenWidth(15),
                        height: screenWidth(15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
