import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/ui/kepatuhan/kepatuhan_provider.dart';

class KepatuhanPage extends StatelessWidget {
  const KepatuhanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => KepatuhanProvider(),
      child: Consumer<KepatuhanProvider>(
        builder: (context, kepatuhanProvider, child) {
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
                              Navigator.pop(context);
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
                            "Kepatuhan",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                          "Surat Pernyataan Persetujuan Minum Obat TB Kategori",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      SizedBox(height: 25),
                      Text("Saya yang bertanda tangan di bawah ini :",
                          style: GoogleFonts.poppins()),
                      SizedBox(height: 35),
                      Table(
                        columnWidths: {
                          0: IntrinsicColumnWidth(
                              flex:
                                  0.7), // Ensures that the first column width is as wide as its contents
                          1: FixedColumnWidth(
                              30.0), // Fixes the width of the colon column
                          2: FlexColumnWidth(), // Allows the third column to take up remaining space
                        },
                        children: [
                          TableRow(children: [
                            Text("Nama", style: GoogleFonts.poppins()),
                            Container(
                                child: Text(":", style: GoogleFonts.poppins())),
                            Text("${dataGlobal.data?.user?.name}",
                                style: GoogleFonts.poppins()),
                          ]),
                          TableRow(children: [
                            Text("Umur", style: GoogleFonts.poppins()),
                            Text(":", style: GoogleFonts.poppins()),
                            Text(
                                "${calculateAge(dataGlobal.data?.user?.tglLhr.toString())} Tahun",
                                style: GoogleFonts.poppins()),
                          ]),
                          TableRow(children: [
                            Text("Jenis Kelamin", style: GoogleFonts.poppins()),
                            Text(":", style: GoogleFonts.poppins()),
                            Text("${dataGlobal.data?.user?.jkel}",
                                style: GoogleFonts.poppins()),
                          ]),
                          TableRow(children: [
                            Text("Alamat", style: GoogleFonts.poppins()),
                            Text(":", style: GoogleFonts.poppins()),
                            Text("${dataGlobal.data?.user?.alamat}",
                                style: GoogleFonts.poppins()),
                          ]),
                        ],
                      ),
                      SizedBox(height: 35),
                      Text(
                        "Dengan ini saya menyatakan dengan bersedia mengikuti prosedur Pengobatan Turbeculosis sebagaimana seperti yang telah dijelaskan oleh petugas kesehatan di Puskesmas Kelong dengan teratur sesuai dengan ketentuan pengobatan yang ada",
                        style: GoogleFonts.poppins(height: 2),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Apabila dikemudian hari saya menghentikan pengobatan secara sepihak, maka siap menerima sanksi dari pihak Puskesmas berupa pengembalian biaya pengobatan Turbecolosis yang telah saya terima.",
                        style: GoogleFonts.poppins(height: 2),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Demikian surat pernyataan ini saya buat dengan sadar dan tanpa ada paksaan dari pihak manapun",
                        style: GoogleFonts.poppins(height: 2),
                      ),
                      SizedBox(height: 20),
                      CheckboxListTile(
                        title: Text('Saya Setuju'),
                        activeColor: Colors.blue,
                        value: kepatuhanProvider.setujuTxt,
                        onChanged: (bool? value) {
                          if (value != null) {
                            kepatuhanProvider.toggleSetuju(value);
                          }
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        onPressed: kepatuhanProvider.setujuTxt && !kepatuhanProvider.isLoading
                            ? () {
                          kepatuhanProvider.addKepatuhan(context);
                        }
                            : null,
                        height: 50,
                        color: Colors.green,
                        minWidth: double.infinity,
                        child: kepatuhanProvider.isLoading
                            ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        )
                            : Text(
                          "Setuju",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide.none,
                        ),
                        disabledColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int? calculateAge(String? birthDateString) {
    if (birthDateString == null) {
      return null;
    }

    DateTime birthDate = DateTime.parse(birthDateString);
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}
