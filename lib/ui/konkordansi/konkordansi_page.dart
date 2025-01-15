import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/ui/konkordansi/konkordansi_provider.dart';
import 'package:roni_api/ui/sukses/sukses_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_html/flutter_html.dart';

class KonkordansiPage extends StatelessWidget {
  const KonkordansiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => KonkordansiProvider(),
      child: Consumer<KonkordansiProvider>(
        builder: (context, konProvider, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
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
                            child: Image.asset("assets/images/icon-profile.png",
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
                    konProvider.isLoading
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
                                            padding: const EdgeInsets.symmetric(
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
                                                          color:
                                                              Colors.grey[300],
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
                            itemCount: konProvider.listPemantauan?.length ?? 0,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final parentIndex = konProvider.listPemantauan?[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    side:
                                        BorderSide(color: Colors.grey.shade200),
                                  ),
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
                                            "${konProvider.listPemantauan?[index].parent?.description ?? ''}",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (parentIndex?.child != null)
                                                for (int childIndex = 0;
                                                    childIndex <
                                                        parentIndex!.child!.length;
                                                    childIndex++)
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 4.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          child: Text(
                                                            // Assuming child.description is a string
                                                            parentIndex
                                                                .child![
                                                                    childIndex]
                                                                .description
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontFamily: GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                        Switch(
                                                          activeColor: Colors.green,
                                                          value: parentIndex.child![childIndex].status == 1,
                                                          onChanged: (bool value) {
                                                            konProvider.toggleSwitch(index, childIndex, value);
                                                          },
                                                        ),
                                                        Text(
                                                          parentIndex.child![childIndex]
                                                                      .status ==
                                                                  1
                                                              ? 'Ya'
                                                              : 'Tidak',
                                                          style: TextStyle(
                                                            color: parentIndex
                                                                        .child![
                                                                            childIndex]
                                                                        .status ==
                                                                    1
                                                                ? Colors.green
                                                                : Colors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                            ],
                                          ),
                                        )
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
          );
        },
      ),
    );
  }
}
