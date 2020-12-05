import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speak_better/route/getx_router.dart';
import 'package:speak_better/route/router_constants.dart';
import 'package:speak_better/ui/splash/splash_page.dart';
import 'package:speak_better/utils/Color_Helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: kPrimaryColor, // navigation bar color
    statusBarColor: kPrimaryColor, // status bar color
  ));
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fimi Hub',
      debugShowCheckedModeBanner: false,
      getPages: Routers.route,
      defaultTransition: Transition.rightToLeft,
      initialRoute: splashLaunch,
      theme: ThemeData(primaryColor: kPrimaryColor, accentColor: kAccentColor),
    );
  }
}
