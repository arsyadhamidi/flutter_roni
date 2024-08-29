import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:roni_api/model/model_berita.dart';
import 'package:roni_api/network/network_provider.dart';

class DashboardProvider extends ChangeNotifier {
  String lokasi = "Lokasi anda saat ini";
  String kota = '';
  String provinsi = '';
  List<DataBerita>? listBerita;
  List<DataBerita>? searchResult;
  bool isLoading = false;
  List<DataBerita>? filteredList;
  String? selectedFilter;

  DashboardProvider() {
    initializeData();
  }

  Future<void> onRefreshDashboard() async{
    await listDataBerita();
  }

  Future<void> initializeData() async {
    try {
      await listDataBerita();
      await getCurrentLocation();
    } catch (e) {
      print('Error initializing data: $e');
    }
  }

  Future<List<DataBerita>?> listDataBerita() async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await NetworkProvider().getDataBerita();
      listBerita = response?.data ?? [];
      filteredList = listBerita;
      print(filteredList);

      isLoading = false;
      notifyListeners();
      return listBerita;
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
    }
  }

  void searchBerita(String query) {
    if (query.isNotEmpty) {
      searchResult = listBerita?.where((berita) =>
      berita.parent?.child?[0].title
          ?.toLowerCase()
          .contains(query.toLowerCase()) ?? false
      )?.toList();
      filteredList = searchResult;
    } else {
      searchResult = null;
      filteredList = listBerita;
    }
    notifyListeners();
  }

  void filterBerita(String description) {
    if (description == 'All') {
      filteredList = listBerita;
    } else {
      filteredList = listBerita
          ?.where((berita) => berita.parent?.description == description)
          .toList();
    }
    selectedFilter = description;
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          print('Izin lokasi ditolak');
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        String city = placemarks[0].subAdministrativeArea ?? 'Unknown';
        String province = placemarks[0].administrativeArea ?? 'Unknown';

        lokasi = "$city, $province";
        notifyListeners();
        print("lokasi : $lokasi");
      } else {
        print('Placemarks is empty');
      }
    } catch (e) {
      print('Error Testing: $e');
      print('Error: $lokasi');
    }
  }
}

