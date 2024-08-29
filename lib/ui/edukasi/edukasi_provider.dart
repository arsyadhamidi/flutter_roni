import 'package:flutter/material.dart';
import 'package:roni_api/model/model_content.dart';
import 'package:roni_api/network/network_provider.dart';

class EdukasiProvider extends ChangeNotifier{

  bool isLoading = false;
  List<DataContent>? listContent;

  EdukasiProvider(){
    listDataContent();
  }

  Future<List<DataContent>?> listDataContent () async{
    try{
      isLoading = true;
      notifyListeners();

      final response  = await NetworkProvider().getDataContent();
      listContent = response?.data ?? [];
      // print(listContent);

      isLoading = false;
      notifyListeners();
      return listContent;
    }catch(e){
      print(e);
      isLoading = true;
      notifyListeners();
    }
  }
}