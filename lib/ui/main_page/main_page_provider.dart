import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/handle/handle_token.dart';
import 'package:roni_api/model/model_user.dart';
import 'package:roni_api/ui/akun/akun_page.dart';
import 'package:roni_api/ui/dashboard/dashboard_page.dart';
import 'package:roni_api/ui/splashscreen/splashscreen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPageProvider extends ChangeNotifier{

  MainPageProvider(BuildContext context){
    getDataUser(context);
  }

  int selectedIndex = 0;
  Future<void> getDataUser(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email =  prefs.getString('dataUser');
    if (email != null) {
      dataGlobal.data = modelUserFromJson(email);
    } else {
      handleTokenExpiry(context);
    }
  }

  void onItemTapped(int index){
    selectedIndex = index;
    notifyListeners();
  }

  static const List<Widget> selectbody = <Widget>[
    DashboardPageView(),
    AkunPageView(),
  ];

}