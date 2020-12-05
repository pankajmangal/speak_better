import 'package:get/get.dart';
import 'package:speak_better/route/router_constants.dart';
import 'package:speak_better/ui/auth/login_page.dart';
import 'package:speak_better/ui/dashboard/main_screen_page.dart';
import 'package:speak_better/ui/splash/splash_page.dart';

class Routers {
  static var route = [
    GetPage(name: splashLaunch, page: () => SplashPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: mainScreen, page: () => MainScreenPage()),
    // GetPage(name: forgot, page: () => ForgotPasswordPage()),
  ];
}