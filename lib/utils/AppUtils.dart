
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AppUtils{
  // static User currentUser;
  // static List<SpecialityListData> specialitiesList;
  static PublishSubject<bool> internetStream = PublishSubject();

  dispose() {
    internetStream?.close();
  }
  AppUtils() {
    print("caa");
    Connectivity connectivity = Connectivity();
    connectivity.onConnectivityChanged.listen((result) {
      print(result);
      if (result == ConnectivityResult.none) {
        internetStream.sink.add(true);
      } else {
        internetStream.sink.add(false);
      }
    });
  }

  static BuildContext con;
  static void showLoadingDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          con = context;
          return Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  static close(){
    Navigator.of(con).pop();
  }

  static void showCalendra(){
    
  }
  static void showError(String message, GlobalKey<ScaffoldState> key,
      [actionLabel, VoidCallback onTap]) {
    key.currentState?.showSnackBar(SnackBar(
      content: new Text(message),
      duration: new Duration(seconds: 3),
      action: actionLabel != null
          ? SnackBarAction(label: actionLabel, onPressed: onTap)
          : null,
    ));
  }
}