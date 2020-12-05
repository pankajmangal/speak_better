import 'dart:async';

import 'package:get/get.dart';
import 'package:speak_better/route/router_constants.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    pageRoute();
  }

  pageRoute() async{
    Timer(Duration(seconds: 3), () => Get.offNamed(mainScreen));
   /* if(await SessionManager().getBoolean('isLogin')){
      Timer(Duration(seconds: 3), () => Get.offNamed(dashboard));
    } else{
      Timer(Duration(seconds: 3), () => Get.offNamed(login));
    }*/
  }
}