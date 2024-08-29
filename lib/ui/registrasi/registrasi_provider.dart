import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:roni_api/api/api_config.dart';
import 'package:roni_api/ui/login/login_page.dart';

class RegistrasiProvider extends ChangeNotifier{

  DateTime? _selectedDate;
  String countryCode = '62';
  String _selectedGender = 'Pria';
  bool _isObscurePassTxt = true;
  bool _isObscureConfTxt = true;
  final GlobalKey<FormState> registrasiFormKey = GlobalKey<FormState>();
  final TextEditingController nikTxt = TextEditingController();
  final TextEditingController namaLengkapTxt = TextEditingController();
  final TextEditingController emailAddressTxt = TextEditingController();
  TextEditingController teleponTxt = TextEditingController();
  final TextEditingController tglLahirTxt = TextEditingController();
  final TextEditingController passwordTxt = TextEditingController();
  final TextEditingController konfirmPasswordTxt = TextEditingController();
  final TextEditingController alamatTxt = TextEditingController();
  final TextEditingController namaKeluargaTxt = TextEditingController();

  // isObscure Password
  bool get isObscurePass => _isObscurePassTxt;
  void inHidePassword() {
    _isObscurePassTxt = !_isObscurePassTxt;
    notifyListeners();
  }

  String get selectedGender => _selectedGender;
  void selectGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void selectCountry(String? value) {
    countryCode = value ?? '62';
    notifyListeners();
  }

  // isObscure Konfirmasi Password
  bool get isObscureConfTxt => _isObscureConfTxt;
  void inHidePasswordConfirm() {
    _isObscureConfTxt = !_isObscureConfTxt;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _selectedDate = date;
    tglLahirTxt.text = DateFormat('yyyy-MM-dd').format(date);
    notifyListeners();
  }

  Future<void> addRegister(BuildContext context) async{
    try {
      final response = await http.post(Uri.parse(ApiConfig.url + "register"), body: {
        'nik': nikTxt.text,
        'name': namaLengkapTxt.text,
        'email': emailAddressTxt.text,
        'nohp': countryCode + teleponTxt.text,
        'password': passwordTxt.text,
        'password_confirmation': konfirmPasswordTxt.text,
        'alamat': alamatTxt.text,
        'tgl_lhr': tglLahirTxt.text,
        'jkel': selectedGender.toString(),
        'nama_keluarga': namaKeluargaTxt.text,
      });

      print(response.body);

      var addUserRegistrasi = await jsonDecode(response.body);

      if (addUserRegistrasi['success'] == true) {
        Fluttertoast.showToast(
            msg: "Anda berhasil melakukan registrasi akun",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPageView()), (route) => false);
      } else {
        String errorMessage = addUserRegistrasi['message'] ?? "Registrasi akun gagal. Silakan coba lagi.";
        Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red, // Menampilkan warna merah untuk kesalahan
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Terjadi kesalahan. Silakan coba lagi nanti.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

}