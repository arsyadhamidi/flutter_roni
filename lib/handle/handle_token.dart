import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roni_api/ui/login/login_page.dart';
import 'package:roni_api/ui/splashscreen/splashscreen_page.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Adjust the import according to your file structure

void handleTokenExpiry(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => SplashScreenPageView()),
        (route) => false,
  );

  Fluttertoast.showToast(
    msg: "Token telah kadaluarsa. Silakan login kembali.",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
