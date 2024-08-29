import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roni_api/global/data_global.dart';

class BiodataDiriPage extends StatelessWidget {
  const BiodataDiriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 168, 53, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Biodata Diri",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.account_circle_sharp, size: 45),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${dataGlobal.data?.user?.name}",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            Text(
                              "NIK. ${dataGlobal.data?.user?.nik}",
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Text("Nomor Induk Kependudukan",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                Text("${dataGlobal.data?.user?.nik}",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic)),
                SizedBox(height: 10),
                Divider(thickness: 1,),
                SizedBox(height: 10),
                Text("Nama Lengkap",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                Text("${dataGlobal.data?.user?.name}",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic)),
                SizedBox(height: 10),
                Divider(thickness: 1,),
                SizedBox(height: 10),
                Text("Tanggal Lahir",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                Text("${dataGlobal.data?.user?.tglLhr}",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic)),
                SizedBox(height: 10),
                Divider(thickness: 1,),
                SizedBox(height: 10),
                Text("Email Address",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                Text("${dataGlobal.data?.user?.email}",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic)),
                SizedBox(height: 10),
                Divider(thickness: 1,),
                SizedBox(height: 10),
                Text("Nama Keluarga",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                Text("${dataGlobal.data?.user?.namaKeluarga}",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic)),
                SizedBox(height: 10),
                Divider(thickness: 1,),
                SizedBox(height: 10),
                Text("Alamat Domisili",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                Text("${dataGlobal.data?.user?.alamat}",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
