import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:roni_api/ui/login/login_page.dart';
import 'package:roni_api/ui/main_page/main_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenProvider extends ChangeNotifier{

  SplashscreenProvider(BuildContext context) {
    getAwal(context);
  }

  void getAwal(BuildContext context) {
    Timer(Duration(seconds: 3), () async {
      var prefs = await SharedPreferences.getInstance();
      var data = prefs.get("dataUser");
      Navigator.pushAndRemoveUntil(
        context,
        // MaterialPageRoute(builder: (context) => data != null ? MainPageView() : LoginPageView()),
        MaterialPageRoute(builder: (context) => LoginPageView()),
            (route) => false,
      );
    });
  }
}