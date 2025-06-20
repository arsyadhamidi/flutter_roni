import 'package:flutter/material.dart';
import 'package:roni_api/ui/splashscreen/splashscreen_page.dart';

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
