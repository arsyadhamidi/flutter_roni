import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roni_api/api/api_config.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/handle/handle_token.dart';
import 'package:roni_api/ui/splashscreen/splashscreen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // To handle JSON conversion

class AkunProvider extends ChangeNotifier{

  bool isLoading = false;

  Future<void> logoutAuth(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(ApiConfig.url + 'logout'),
        headers: {
          'Authorization': 'Bearer ${dataGlobal.data?.token}',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.clear();

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SplashScreenPageView()),
                (route) => false,
          );
        } else {
          Fluttertoast.showToast(
            msg: responseData['message'] ?? "Gagal keluar. Silakan coba lagi nanti.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        handleTokenExpiry(context);
      } else {
        Fluttertoast.showToast(
          msg: "Server error: ${response.statusCode}. ${response.reasonPhrase}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print('Error: $e');
      Fluttertoast.showToast(
        msg: "Terjadi kesalahan. Silakan coba lagi nanti.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


}
