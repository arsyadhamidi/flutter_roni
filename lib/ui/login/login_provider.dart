import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:roni_api/api/api_config.dart';
import 'package:roni_api/model/model_user.dart';
import 'package:roni_api/ui/main_page/main_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {

  bool _isObscureTxt = true;
  bool isLoading = false;
  String countryCode = '62';
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController teleponTxt = TextEditingController();
  final TextEditingController passwordTxt = TextEditingController();

  bool get isObscureTxt => _isObscureTxt;

  void inHidePassword() {
    _isObscureTxt = !_isObscureTxt;
    notifyListeners();
  }

  void selectCountry(String? value) {
    countryCode = value ?? '62';
    notifyListeners();
  }

  Future<void> loginAuth(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      final response =
          await http.post(Uri.parse(ApiConfig.url + "login"), body: {
        'nohp': countryCode + teleponTxt.text,
        'password': passwordTxt.text,
      });

      print(response.body);

      if (response.statusCode == 200) {
        ModelUser getDataUser = modelUserFromJson(response.body);

        if (getDataUser.success == true) {
          await saveSharedPreference(getDataUser);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainPageView()),
              (route) => false);
        } else {
          Fluttertoast.showToast(
            msg: "Maaf, login tidak berhasil. Mari kita coba lagi.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Terjadi kesalahan pada server. Silakan coba lagi nanti.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Terjadi kesalahan. Silakan coba lagi nanti.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveSharedPreference(ModelUser getDataUser) async {
    SharedPreferences prefsUser = await SharedPreferences.getInstance();
    prefsUser.setString("dataUser", jsonEncode(getDataUser));
  }
}
