import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/my_app_controller.dart';
import 'package:flutter_app/core/enums/connectivityStatus.dart';
import 'package:flutter_app/core/translation/app_translation.dart';
import 'package:flutter_app/ui/shared/utils.dart';
import 'package:flutter_app/ui/views/chat_view/chat_view.dart';
import 'package:flutter_app/ui/views/edit_student_profile_view/edit_student_profile_view.dart';
import 'package:flutter_app/ui/views/home_user_view/home_user_view.dart';

import 'package:flutter_app/ui/views/main_view/main_view.dart';
import 'package:flutter_app/ui/views/sign_up_user_view/sign_up_user_view.dart';
import 'package:flutter_app/ui/views/splash_view/splash_view.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../ui/views/ai_camera_view/camera_ai_view.dart';
import '../ui/views/home_student_view/home_student_view.dart';
import '../ui/views/login_doctor_view/login_doctor_view.dart';
import '../ui/views/login_user_view/login_user_view.dart';
import '../ui/views/sign_up_student_view/sign_up_student_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        locale: getLocal(),
        translations: AppTranslation(),
        navigatorObservers: [BotToastNavigatorObserver()],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashView());
  }
}

Locale getLocal() {
  String langCode = storage.getAppLanguage();
  if (langCode == 'ar')
    return Locale('ar', 'SA');
  else if (langCode == 'en')
    return Locale('en', 'US');
  else if (langCode == 'tr')
    return Locale('tr', 'TR');
  else
    return Locale('fr', 'FR');
}
