import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roni_api/ui/splashscreen/splashscreen_provider.dart';
import 'package:provider/provider.dart';

class SplashScreenPageView extends StatelessWidget {
  const SplashScreenPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashscreenProvider(context),
      child: Consumer<SplashscreenProvider>(
        builder: (context, splash, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Spacer(),
                  Image.asset("assets/images/logo.png"),
                  Spacer(),
                  Text("Only This", style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
