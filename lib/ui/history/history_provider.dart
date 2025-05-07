// history_provider.dart

import 'package:flutter/material.dart';
import 'package:roni_api/model/model_history.dart';
import 'package:roni_api/network/network_provider.dart';

class HistoryProvider extends ChangeNotifier {
  bool isLoading = false;
  List<HistoryData>? listHistory;

  HistoryProvider() {
    fetchHistory();
  }

  Future<List<HistoryData>?> fetchHistory() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await NetworkProvider().getDataHistory();
      listHistory = response?.data ?? [];

      isLoading = false;
      notifyListeners();
      return listHistory;
    } catch (e) {
      print('Error fetching history: $e');
      isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
