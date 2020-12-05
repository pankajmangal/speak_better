import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MainScreenController extends GetxController{

  stt.SpeechToText speechToText;
  RxBool isListening = false.obs;
  double confidence = 1.0;
  TextEditingController speechController;
  RxInt AndTextCounter = 0.obs;
  RxInt AhTextCounter = 0.obs;
  RxInt ButTextCounter = 0.obs;
  RxInt LikeTextCounter = 0.obs;
  RxInt RepeatTextCounter = 0.obs;
  RxInt SoTextCounter = 0.obs;
  RxInt YouKnowTextCounter = 0.obs;
  RxInt WellTextCounter = 0.obs;
  RxInt HmmTextCounter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    speechController = TextEditingController();
    speechToText = stt.SpeechToText();
  }

  void listen() async {
    if (!isListening.value) {
      bool available = await speechToText.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
         isListening.value = true;
         speechToText.listen(
          onResult: (val) {
            speechController.text = val.recognizedWords;
            if(val.recognizedWords.toLowerCase().contains("And".toLowerCase())){
              AndTextCounter++;
              print('helloCounter -> ${AndTextCounter}');
            }else if(val.recognizedWords.toLowerCase().contains("Ah".toLowerCase())){
              AhTextCounter++;
              print('helloCounter -> ${AhTextCounter}');
            }else if(val.recognizedWords.toLowerCase().contains("But".toLowerCase())){
              ButTextCounter++;
              print('helloCounter -> ${ButTextCounter}');
            }else if(val.recognizedWords.toLowerCase().contains("Like".toLowerCase())){
              LikeTextCounter++;
              print('helloCounter -> ${LikeTextCounter}');
            }else if(val.recognizedWords.toLowerCase().contains("Repeat".toLowerCase())){
              RepeatTextCounter++;
              print('helloCounter -> ${RepeatTextCounter}');
            }else if(val.recognizedWords.toLowerCase().contains("So".toLowerCase())){
              SoTextCounter++;
              print('helloCounter -> ${SoTextCounter++}');
            }else if(val.recognizedWords.toLowerCase().contains("You know".toLowerCase())){
              YouKnowTextCounter++;
              print('helloCounter -> ${YouKnowTextCounter}');
            }else if(val.recognizedWords.toLowerCase().contains("Well".toLowerCase())){
              WellTextCounter++;
              print('helloCounter -> ${WellTextCounter}');
            }else if(val.recognizedWords.toLowerCase().contains("Hmm".toLowerCase())){
              HmmTextCounter++;
              print('helloCounter -> ${HmmTextCounter}');
            }
            if (val.hasConfidenceRating && val.confidence > 0) {
              confidence = val.confidence;
            }
          },
        );
      }
    } else {
      isListening.value = false;
      speechController.text = "";
      AndTextCounter.value = 0;
      AhTextCounter.value = 0;
      ButTextCounter.value = 0;
      LikeTextCounter.value = 0;
      YouKnowTextCounter.value = 0;
      RepeatTextCounter.value = 0;
      SoTextCounter.value = 0;
      WellTextCounter.value = 0;
      HmmTextCounter.value = 0;
      speechToText.stop();
    }
  }

  @override
  void onClose() {
    super.onClose();
    speechToText?.cancel();
    speechController?.dispose();
  }
}