import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roni_api/api/api_config.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/model/model_pemantauan.dart';
import 'package:roni_api/network/network_provider.dart';
import 'package:http/http.dart' as http;

class KonkordansiProvider extends ChangeNotifier {
  bool isLoading = false;
  bool valueData = false;
  List<DataPemantauan>? listPemantauan;

  KonkordansiProvider() {
    listDataPemantauan();
  }

  Future<List<DataPemantauan>?> listDataPemantauan() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await NetworkProvider().getDataPemantauan();
      listPemantauan = response?.data ?? [];
      print(listPemantauan);

      isLoading = false;
      notifyListeners();
      return listPemantauan;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
    }
  }

  void toggleSwitch(int index, int childIndex, bool value) async {
    if (listPemantauan != null &&
        listPemantauan!.isNotEmpty &&
        listPemantauan![index].child != null &&
        listPemantauan![index].child!.isNotEmpty &&
        listPemantauan![index].child![childIndex] != null) {
      listPemantauan![index].child![childIndex].status = value ? 1 : 0;
      notifyListeners();

      await updateDataPemantauan(
          int.parse(
              listPemantauan![index].child![childIndex].id.toString() ?? ''),
          value ? '1' : '0');
    }
  }

  Future<void> updateDataPemantauan(int id, String statusId) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.url + 'pemantauan/transaksi'),
        body: jsonEncode({
          'pemantauanchildid': id,
          'status': statusId,
        }),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${dataGlobal.data?.token}',
        },
      );

      var tambahPemantauan = await jsonDecode(response.body);
      print(tambahPemantauan);

    } catch (e) {
      Fluttertoast.showToast(
        msg: "Terjadi kesalahan. Silakan coba lagi.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
