import 'package:assignment/screen/homepage/homepage_binding.dart';
import 'package:assignment/screen/homepage/homepage_screen.dart';
import 'package:assignment/screen/login/login_binding.dart';
import 'package:assignment/screen/login/login_screen.dart';
import 'package:assignment/screen/otp/otp_binding.dart';
import 'package:assignment/screen/otp/otp_screen.dart';
import 'package:assignment/screen/splash/splash_binding.dart';
import 'package:assignment/screen/splash/splash_screen.dart';
import 'package:assignment/screen/welcome/welcome_binding.dart';
import 'package:assignment/screen/welcome/welcome_screen.dart';
import 'package:get/get.dart';

import 'app_route.dart';


class AppPages {
  static const initialRoute = AppRoutes.splash;
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen(), binding: SplashBinding()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: AppRoutes.otp, page: () => OtpScreen(), binding: OtpBinding()),
    GetPage(name: AppRoutes.welcome, page: () => WelcomeScreen(), binding: WelcomeBinding()),
    GetPage(name: AppRoutes.homepage, page: () => HomePageScreen(), binding: HomePageBinding()),
  ];
}
