import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/ui/akun/akun_provider.dart';
import 'package:roni_api/ui/biodata-diri/biodata_diri_page.dart';
import 'package:roni_api/ui/splashscreen/splashscreen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AkunPageView extends StatelessWidget {
  const AkunPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AkunProvider(),
      child: Consumer<AkunProvider>(
        builder: (context, akunProvider, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text("Pengaturan",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w600)),
              elevation: 3,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(CupertinoIcons.person_alt_circle_fill,
                                  color: Colors.white, size: 50),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${dataGlobal.data?.user?.name}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18)),
                                  Text("NIK. ${dataGlobal.data?.user?.nik}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14)),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.circle,
                                color: Colors.yellow[500],
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BiodataDiriPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.account_circle_sharp, size: 30, color: Colors.red,),
                          title: Text("Biodata Diri", style: GoogleFonts.poppins(),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.insert_comment_sharp, size: 30, color: Colors.orange,),
                        title: Text("Faq", style: GoogleFonts.poppins(),),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.favorite, size: 30, color: Colors.green,),
                        title: Text("Riwayat", style: GoogleFonts.poppins(),),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.edit, size: 30, color: Colors.blue,),
                        title: Text("Edit Profile", style: GoogleFonts.poppins(),),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: MaterialButton(
                      onPressed: akunProvider.isLoading ? null : () async {
                        akunProvider.logoutAuth(context);
                        // var prefs = await SharedPreferences.getInstance();
                        // prefs.clear();
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SplashScreenPageView()),
                        //         (route) => false);
                      }, child: akunProvider.isLoading
                        ? CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blue)) :Text("Keluar", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),),
                      minWidth: double.infinity,
                      height: 48,
                      color: Color.fromRGBO(55, 168, 53, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide.none
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
