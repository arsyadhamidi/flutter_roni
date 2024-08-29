import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roni_api/ui/main_page/main_page_view.dart';

class SuksesPage extends StatelessWidget {
  const SuksesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPageView()),
                            (route) => false);
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Simpan Formulir Berhasil",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Center(
                  child: Text("Terima Kasih!",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                Center(
                  child: Text("Saya senang bisa membantu",
                      style: GoogleFonts.poppins()),
                ),
                SizedBox(height: 40),
                Center(
                  child: Image.asset("assets/images/sukses.png", scale: 2),
                ),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 300,
                      child: Text(
                          "Semoga hari Anda juga menyenangkan dan penuh kebahagiaan. ",
                          style: GoogleFonts.poppins(), textAlign: TextAlign.center,)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
