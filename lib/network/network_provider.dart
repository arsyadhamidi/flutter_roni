import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roni_api/api/api_config.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/model/model_berita.dart';
import 'package:roni_api/model/model_content.dart';
import 'package:roni_api/model/model_history.dart';
import 'package:roni_api/model/model_kepatuhan.dart';
import 'package:roni_api/model/model_pemantauan.dart';

class NetworkProvider{

  Future<ModelContent?> getDataContent () async{
    final response = await http.get(Uri.parse(ApiConfig.url + "content"), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${dataGlobal.data?.token}',
    },);
    ModelContent getContent = await modelContentFromJson(response.body);
    return getContent;
  }
  
  Future<ModelPemantauan?> getDataPemantauan () async{
    final response = await http.get(Uri.parse(ApiConfig.url + "pemantauan/transaksi"), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${dataGlobal.data?.token}',
    },);
    ModelPemantauan getPemantauan = await modelPemantauanFromJson(response.body);
    return getPemantauan;
  }

  Future<ModelKepatuhan?> getDataKepatuhan () async{
    final response = await http.get(Uri.parse(ApiConfig.url + 'pernyataan/transaksi'), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${dataGlobal.data?.token}',
    });
    ModelKepatuhan getKepatuhan = await modelKepatuhanFromJson(response.body);
    return getKepatuhan;
  }

  Future<ModelBerita?> getDataBerita() async{
    final response = await http.get(Uri.parse(ApiConfig.url + 'berita'), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${dataGlobal.data?.token}',
    });
    ModelBerita getBerita = await modelBeritaFromJson(response.body);
    return getBerita;
  }

  Future<ModelHistory?> getDataHistory() async{
    final response = await http.get(Uri.parse(ApiConfig.url + 'history'), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${dataGlobal.data?.token}',
    });
    ModelHistory getHistory = await modelHistoryFromJson(response.body);
    return getHistory;
  }

}