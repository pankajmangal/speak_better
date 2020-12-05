import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:speak_better/ui/splash/controller/splash_controller.dart';
import 'package:speak_better/utils/Color_Helper.dart';

class SplashPage extends StatelessWidget {
  final SplashController _splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              child: Icon(Icons.speaker_outlined, size: 60, color: Colors.white,),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor),
            ),
            SizedBox(height: 20,),
            Text('Speak Better',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: kPrimaryColor
            ),)
          ],
        ),
      ),
    );
  }
}
