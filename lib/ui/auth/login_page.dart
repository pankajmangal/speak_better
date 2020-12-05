import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:speak_better/route/router_constants.dart';
import 'package:speak_better/ui/auth/controller/login_controller.dart';
import 'package:speak_better/utils/Color_Helper.dart';
import 'package:speak_better/utils/Gap.dart';
import 'package:speak_better/utils/Images_Helper.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalGap(gap: 60,),
            Container(
              width: 160,
              height: 160,
              child: Icon(Icons.speaker_outlined, size: 60, color: Colors.white,),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor),
            ),
            VerticalGap(gap: 20,),
            Text('Speak Better',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor
              ),),
            VerticalGap(gap: 80,),
            FlatButton(onPressed: (){
              Get.toNamed(mainScreen);
            },
                minWidth: 220,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.2, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(6.0)),
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
              children: [
                  SvgPicture.asset(GOOGLE_LOGO, width: 28, height: 28, color: kPrimaryColor,),
                  HorizontalGap(gap: 12),
                  Text('Login via Google', style: TextStyle(
                    fontSize: 18,
                    color: kPrimaryColor
                  ),)
              ],
            ),
                )),
            VerticalGap(gap: 12),
            FlatButton(onPressed: (){},
                minWidth: 220,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.2, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(6.0)),
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(FACEBOOK_LOGO, width: 28, height: 28, color: kPrimaryColor,),
                      HorizontalGap(gap: 12),
                      Text('Login via Facebook', style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryColor
                      ),)
                    ],
                  ),
                )),
            VerticalGap(gap: 12),
            FlatButton(onPressed: (){},
                minWidth: 220,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.2, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(6.0)),
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(MICROSOFT_LOGO, width: 28, height: 28, color: kPrimaryColor,),
                      HorizontalGap(gap: 12),
                      Text('Login via Microsoft', style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryColor
                      ),)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
