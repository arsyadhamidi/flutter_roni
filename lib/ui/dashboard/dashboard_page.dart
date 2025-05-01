import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:roni_api/global/data_global.dart';
import 'package:roni_api/ui/dashboard/dashboard_provider.dart';
import 'package:roni_api/ui/edukasi/edukasi_page.dart';
import 'package:roni_api/ui/kepatuhan/kepatuhan_page.dart';
import 'package:roni_api/ui/konkordansi/konkordansi_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPageView extends StatelessWidget {
  const DashboardPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardProvider(),
      child: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: RefreshIndicator(
              onRefresh: dashboardProvider.onRefreshDashboard,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25),
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/banner.png"),
                                  fit: BoxFit.fill),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hi, ${dataGlobal.data?.user?.name}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text("Selamat Datang di Aplikasi Kami",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  Lottie.asset(
                                    'assets/animations/animasi.json', // path to your Lottie animation file
                                    height: 100, // adjust height as needed
                                    width: 100, // adjust width as needed
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //  Column 1
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EdukasiPage()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(
                                            "assets/images/edukasi.png",
                                            scale: 3),
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Edukasi",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              //  Column 1
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              KonkordansiPage()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(
                                            "assets/images/konkordansi.png",
                                            scale: 10),
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Konkordansi",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              //  Column 1
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              KepatuhanPage()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(
                                            "assets/images/kepatuhan.png",
                                            scale: 10),
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Kepatuhan",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300)),
                              hintText: "Pencarian berita kesehatan",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.grey),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                            onChanged: (query) {
                              dashboardProvider.searchBerita(query);
                            },
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Berita",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Terbaru",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            child: ListView.builder(
                              itemCount:
                                  (dashboardProvider.listBerita?.length ?? 0) +
                                      1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return GestureDetector(
                                    onTap: () {
                                      dashboardProvider.filterBerita('All');
                                    },
                                    child: Card(
                                      color: dashboardProvider.selectedFilter ==
                                              'All'
                                          ? Colors.green
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Center(
                                          child: Text(
                                            'Semua',
                                            style: GoogleFonts.poppins(
                                              color: dashboardProvider
                                                          .selectedFilter ==
                                                      'All'
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  final description = dashboardProvider
                                      .listBerita?[index - 1]
                                      .parent
                                      ?.description;
                                  return GestureDetector(
                                    onTap: () {
                                      dashboardProvider
                                          .filterBerita(description ?? 'All');
                                    },
                                    child: Card(
                                      color: dashboardProvider.selectedFilter ==
                                              description
                                          ? Colors.green
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Center(
                                          child: Text(
                                            description ?? 'All',
                                            style: GoogleFonts.poppins(
                                              color: dashboardProvider
                                                          .selectedFilter ==
                                                      description
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          dashboardProvider.isLoading
                              ? Center(
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
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.circle,
                                                              color:
                                                                  Colors.green,
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
                                                          Icons
                                                              .arrow_forward_ios,
                                                          size: 12,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      dashboardProvider.filteredList?.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    final berita =
                                        dashboardProvider.filteredList?[index];
                                    return InkWell(
                                      onTap: () {
                                        launch(berita?.parent?.child?[0].url ??
                                            '-');
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      "${berita?.parent?.child?[0].urlToImage ?? ''}",
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    child: Text(
                                                      "${berita?.parent?.child?[0].title ?? ''}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
      ),
    );
  }
}
