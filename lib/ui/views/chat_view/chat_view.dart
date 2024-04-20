import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/textfield_type.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/colors.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_app/ui/shared/utils.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<String> imageUrl = [
    "https://cdn.pixabay.com/photo/2019/08/06/08/26/man-4387721__340.jpg",
    "https://cdn.pixabay.com/photo/2017/02/23/13/05/profile-2092113__340.png",
    "https://cdn.pixabay.com/photo/2017/09/12/19/31/girl-2743378__340.png",
    "https://cdn.pixabay.com/photo/2016/05/17/22/16/baby-1399332__340.jpg",
    "https://cdn.pixabay.com/photo/2016/02/17/00/09/girl-looking-profile-1204289__340.jpg",
    "https://cdn.pixabay.com/photo/2016/10/07/19/59/profile-1722502__340.jpg",
    "https://cdn.pixabay.com/photo/2019/07/10/11/45/girl-4328462__340.jpg",
    "https://cdn.pixabay.com/photo/2016/08/31/02/10/girl-1632515__340.jpg",
    "https://cdn.pixabay.com/photo/2016/08/31/02/10/girl-1632515__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(screenWidth(30)),
        decoration: BoxDecoration(gradient: AppColors.linearGradientOne),
        child: ListView(
          children: [
            CustomText(text: tr("key_chat")),
            SizedBox(
              height: screenWidth(30),
            ),
            CustomTextField(
                prefixIcon: Icon(
                  Icons.search,
                  size: screenWidth(20),
                ),
                fillColor: AppColors.whiteColor,
                hintText: tr("key_search_of_your_friend"),
                typeOfTextField: TypeOfTextField.NORMAL,
                obscureStatus: false),
            SizedBox(
              height: screenWidth(30),
            ),
            ListView.builder(
              itemCount: imageUrl.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return chatTile(
                    imageUrl[index],
                    "userName",
                    "msg",
                    "9Am",
                    false,
                    "اخر ظهور ساعة 2:00  م",
                    "دكتور بس تتخرج بتضل عم تعالجنا ببلاش");
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget chatTile(String imgUrl, String userName, String msg, String date,
    bool seen, String lastSeen, String lastMessage) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.all(screenWidth(70)),
      height: screenWidth(4.4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: screenWidth(4.5),
            width: screenWidth(4.5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: screenWidth(100), color: AppColors.greenColor),
                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: screenWidth(50),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(text: userName),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(text: date),
                        SizedBox(
                          height: screenWidth(100),
                        ),
                        CustomText(
                          text: lastSeen,
                          styleType: TextStyleType.SMALL,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      seen ? Icons.check_circle : Icons.check_circle_outline,
                      size: screenWidth(18),
                      color: AppColors.greenColor,
                    ),
                    SizedBox(
                      width: screenWidth(60),
                    ),
                    Expanded(
                        child: CustomText(
                      text: lastMessage,
                      styleType: TextStyleType.SMALL,
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
