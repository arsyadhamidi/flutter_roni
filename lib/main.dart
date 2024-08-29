import 'package:flutter/material.dart';
import 'package:roni_api/ui/login/login_provider.dart';
import 'package:roni_api/ui/registrasi/registrasi_provider.dart';
import 'package:roni_api/ui/splashscreen/splashscreen_page.dart';
import 'package:provider/provider.dart';
import 'package:roni_api/ui/splashscreen/splashscreen_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenPageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

