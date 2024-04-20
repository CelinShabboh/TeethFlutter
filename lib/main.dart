import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/my_app.dart';
import 'package:flutter_app/app/my_app_controller.dart';

import 'package:flutter_app/core/data/repository/shared_prefrence_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //! Get.put(SharedPrefrenceRepository());
  Get.lazyPut(
    () => SharedPrefrenceRepository(),
  );

  await Get.putAsync<SharedPreferences>(
    () async {
      return await SharedPreferences.getInstance();
    },
  );

//  Get.put(ConnectivitySerivce());
  await Get.putAsync<MyAppController>(
    () async {
      return await MyAppController();
    },
  );

  runApp(MyApp());
}
