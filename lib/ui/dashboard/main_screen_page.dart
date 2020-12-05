import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speak_better/ui/dashboard/controller/main_screen_controller.dart';
import 'package:speak_better/utils/Color_Helper.dart';
import 'package:speak_better/utils/Gap.dart';
import 'package:speak_better/utils/String_Helper.dart';
import 'package:speak_better/utils/constant.dart';
import 'package:get/get.dart';

class MainScreenPage extends StatelessWidget {
  final MainScreenController _mainScreenController = Get.put(MainScreenController());
  var width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _mainScreenController.isListening.value,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        showTwoGlows: true,
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () => _mainScreenController.listen(),
          child: Icon(_mainScreenController.isListening.value ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text('Speak Better',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87
                        ),),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Text('Logout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54
                          ),),
                        onTap: (){
                          getLogoutValue();
                        },
                      ),
                    )
                  ],
                ),
                VerticalGap(gap: 8,),
                Text('Confidence : ${(_mainScreenController.confidence * 100.0).toStringAsFixed(1)}%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54
                  ),),
                VerticalGap(gap: 25,),
                // AvatarGlow(
                //   // animate: true,
                //   glowColor: Theme.of(context).primaryColor,
                //   repeat: true,
                //   endRadius: 75.0,
                //   duration: const Duration(microseconds: 2000),
                //   repeatPauseDuration: const Duration(microseconds: 100),
                //   child: FloatingActionButton(
                //     backgroundColor: kPrimaryColor,
                //     onPressed: () => _mainScreenController.listen(),
                //     child: Icon(_mainScreenController.isListening.value ? Icons.mic : Icons.mic_none),
                //   ),
                // ),
                // VerticalGap(gap: 12,),
                Wrap(
                  direction: Axis.horizontal,
                  children: phraseList.map((item) => phraseItem(item, phraseList.indexOf(item))).toList().cast<Widget>(),
                ),
                VerticalGap(gap: 12,),
                TextFormField(
                  controller: _mainScreenController.speechController,
                  keyboardType: TextInputType.multiline,
                  minLines: 8,
                  maxLines: null,
                  readOnly: true,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(2.0),
                      ),
                    ),
                  ),
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Message is required';
                    }
                    return null;
                  },
                ),
                VerticalGap(gap: 12,),
                Row(
                  children: [
                    FlatButton(onPressed: (){
                      // Get.toNamed(mainScreen);
                    },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.2, color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(16.0)),
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.refresh),
                              HorizontalGap(gap: 8),
                              Text('Reset', style: TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryColor
                              ),)
                            ],
                          ),
                        )),
                    HorizontalGap(gap: 14),
                    FlatButton(onPressed: (){
                      // Get.toNamed(mainScreen);
                    },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.2, color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(16.0)),
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.keyboard_voice),
                              HorizontalGap(gap: 8),
                              Text('Mute Sounds', style: TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryColor
                              ),)
                            ],
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

    Widget phraseItem(String phrase, int index){
    print('index => $index');
      return Container(
        width: width/3.5,
        padding: EdgeInsets.fromLTRB(2, 6, 2, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(phrase),
            HorizontalGap(gap: 6),
            Container(
              width: 24,
              height: 24,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.rectangle
              ),
              child: index == 0
                  ? Obx(() => Text(_mainScreenController.AndTextCounter.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),))
              : index == 1 ? Text(_mainScreenController.AhTextCounter.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),)
            : index == 2 ? Text(_mainScreenController.ButTextCounter.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),)
                  : index == 3 ? Text(_mainScreenController.LikeTextCounter.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),)
                  : index == 4 ? Text(_mainScreenController.RepeatTextCounter.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),)
                  : index == 5 ? Text(_mainScreenController.SoTextCounter.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),)
                  : index == 6 ? Text(_mainScreenController.YouKnowTextCounter.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),)
                  : index == 7 ? Text(_mainScreenController.WellTextCounter.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),)
                  : index == 8 ? Text(_mainScreenController.HmmTextCounter.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),)
                  : Text('0',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),)
            )
          ],
        ),
      );
  }

  Future<Null> getLogoutValue() async {
    String returnVal = await Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          elevation: 12,
          backgroundColor: Colors.white,
          child: Container(
            height: 170,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                /*mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,*/
                children: [
                  Text(
                    logoutString,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,),
                  ),
                  SizedBox(height: 6,),
                  Text(logoutMessageString,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: Colors.black),),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: kPrimaryColor)),
                          color: Colors.white,
                          height: 42,
                          textColor: kPrimaryColor,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            noString,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),),
                      SizedBox(width: 12),
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Colors.white)),
                          onPressed: () {
                            Get.back(result: 'logout');
                          },
                          height: 42,
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          child: Text(yesString,
                              style: TextStyle(fontSize: 16)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ), barrierDismissible: false
    );

    if (returnVal == 'logout') {
      // _dashboardController.logoutUser();
    }
  }

 /* void getWordCounter(int index){
    switch(index){
      case 0 :
        break;
    }
  }*/
}
