import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/ui/edukasi/edukasi_provider.dart';
import 'package:shimmer/shimmer.dart';

class EdukasiPage extends StatelessWidget {
  const EdukasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EdukasiProvider(),
      child: Consumer<EdukasiProvider>(
        builder: (context, edukasiProvider, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: RefreshIndicator(
              onRefresh: edukasiProvider.listDataContent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 252,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/bg-profile.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 30),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                            ),
                            Center(
                              child: Image.asset(
                                  "assets/images/icon-profile.png",
                                  scale: 2),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                "${dataGlobal.data?.user?.name}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                            Center(
                              child: Text(
                                "NIK. ${dataGlobal.data?.user?.nik}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          "Platform Aplikasi Aplikasi digital Model Roni(Konkodansi Obatan Interaktif) :",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      edukasiProvider.isLoading
                          ? Padding(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Column(
                                    children: List.generate(
                                        6,
                                        (index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors
                                                            .grey.shade200)),
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.circle,
                                                            color: Colors.green,
                                                            size: 15,
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                            width: 150,
                                                            height: 20,
                                                            color: Colors
                                                                .grey[300],
                                                          ),
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 12,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                  ),
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  edukasiProvider.listContent?.length ?? 0,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.grey.shade200)),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ExpansionTile(
                                        title: Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Colors.green,
                                              size: 15,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "${edukasiProvider.listContent?[index].parent?.description}",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                for (var child in edukasiProvider.listContent?[index].child ?? [])
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                                    child: Html(
                                                      data: child.description,
                                                      style: {
                                                        "body": Style(
                                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                                          fontSize: FontSize(14),
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                        "b": Style(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
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
}
