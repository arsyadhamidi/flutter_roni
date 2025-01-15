import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:roni_api/api/api_config.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/network/network_provider.dart';
import 'package:roni_api/ui/sukses/sukses_page.dart';

class KepatuhanProvider extends ChangeNotifier{

  bool _setujuTxt = false;
  bool isLoading = false;
  String _usersIdStatus = '';

  KepatuhanProvider()
  {
    checkDataKepatuhan();
  }

  bool get setujuTxt => _setujuTxt;

  void toggleSetuju(bool value) {
    _setujuTxt = value;
    notifyListeners();
  }

  Future<void> addKepatuhan(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try{
      final response = await http.post(
        Uri.parse(ApiConfig.url + 'pernyataan/transaksi'),
        body: jsonEncode({
          'status': 1,
        }),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${dataGlobal.data?.token}',
        },
      );

      var tambahKepatuhan = jsonDecode(response.body);

      if (tambahKepatuhan['success'] == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SuksesPage()),
              (route) => false,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Maaf, setujui terlebih dahulu untuk kepatuhan minum obat.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch(e){
      Fluttertoast.showToast(
        msg: "Terjadi kesalahan. Silakan coba lagi.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String get usersIdStatus => _usersIdStatus;

  Future<void> checkDataKepatuhan() async {
    try {
      final response = await NetworkProvider().getDataKepatuhan();
      _usersIdStatus = response?.data?.status?.toString() ?? ''; // memastikan status menjadi string jika perlu

      if (_usersIdStatus == '1') {  // Pastikan ini sesuai dengan tipe yang diterima, jika int maka gunakan if (_usersIdStatus == 1)
        _setujuTxt = true;
      } else {
        _setujuTxt = false;
      }

      notifyListeners();  // Pastikan untuk memanggil notifyListeners setelah perubahan status
    } catch (e) {
      print(e);
    }
  }



}