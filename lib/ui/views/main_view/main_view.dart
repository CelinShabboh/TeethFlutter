// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_app/ui/shared/colors.dart';
// import 'package:flutter_app/ui/views/chat_view/chat_view.dart';
// import 'package:flutter_app/ui/views/edit_profile_view/edit_profile_view.dart';
// import 'package:flutter_app/ui/views/home_view/home_view.dart';
// import 'package:flutter_app/ui/views/login_doctor_view/login_doctor_view.dart';

// import 'package:flutter_app/ui/views/main_view/main_view_widgets/bottom_navigation_bar.dart';
// import 'package:flutter_app/ui/views/messages_view/messages_view.dart';
// import 'package:flutter_app/ui/views/otp_code_view/otp_code_view.dart';
// import 'package:flutter_app/ui/views/sign_up_student_view/sign_up_student_view.dart';
// import 'package:flutter_app/ui/views/sign_up_view/sign_up_view.dart';
// import 'package:flutter_app/ui/views/splash_view/splash_view.dart';

// class MainView extends StatefulWidget {
//   const MainView({super.key});

//   @override
//   State<MainView> createState() => _MainViewState();
// }

// class _MainViewState extends State<MainView> {
//   PageController controller = PageController();
//   BottomNavigationEnum selecte = BottomNavigationEnum.HOME;

//   GlobalKey<ScaffoldState> scafolldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backGroundColor,
//       key: scafolldKey,
//       bottomNavigationBar: CustomBottmNavigation(
//         onTap: (View, ix) {
//           selecte = View;
//           setState(() {});
//           controller.jumpToPage(ix);
//           //! here notify onTap in navitem
//         },
//         selectedView: selecte,
//       ),
//       body: PageView(
//         physics: NeverScrollableScrollPhysics(),
//         controller: controller,
//         children: [HomeView(), ChatView(), EditProfileView(), MessagesView()],
//       ),
//     );
//   }
// }
