import 'dart:async';

import 'package:get/get.dart';

import '../../app_route.dart';
import '../../common_function.dart';

class SplashController extends GetxController{


  @override
  void onInit() {
    Timer(Duration(seconds: 3), () async {
        Get.offNamed(AppRoutes.login);
    });
    super.onInit();
  }
}