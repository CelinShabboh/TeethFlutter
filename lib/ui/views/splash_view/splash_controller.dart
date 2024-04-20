import 'package:flutter_app/ui/views/landing_view%20copy/landing_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await goToLanding();
    super.onInit();
  }

  goToLanding() async {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Get.off(() => landingView()));
  }
}
