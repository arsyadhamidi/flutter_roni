import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqPage extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
      "question": "Apa itu Tuberkulosis (TBC)?",
      "answer":
          "Tuberkulosis adalah penyakit menular yang disebabkan oleh bakteri Mycobacterium tuberculosis. Umumnya menyerang paru-paru, tetapi juga bisa menyerang organ tubuh lain."
    },
    {
      "question": "Bagaimana TBC menular?",
      "answer":
          "TBC menular melalui droplet (percikan dahak) dari penderita saat batuk atau bersin, yang bisa terhirup oleh orang lain."
    },
    {
      "question": "Apa saja gejala TBC?",
      "answer":
          "Batuk lebih dari 3 minggu, demam pagi, sesak napas, nyeri dada, berat badan menurun, keringat malam, dan nafsu makan berkurang."
    },
    {
      "question": "Apa itu TBC Paru BTA positif dan negatif?",
      "answer":
          "BTA Positif: Ditemukan kuman TB dalam dahak. BTA Negatif: Tidak ditemukan kuman TB tapi rontgen menunjukkan tanda TBC aktif."
    },
    {
      "question": "Apa itu TBC Ekstra Paru?",
      "answer":
          "TBC yang menyerang organ selain paru-paru, seperti tulang, otak, usus, atau kelenjar getah bening."
    },
    {
      "question": "Siapa saja yang termasuk tipe penderita TBC?",
      "answer":
          "Kasus baru, kambuh (relaps), pindahan, dan setelah lalai minum obat selama lebih dari 2 bulan."
    },
    {
      "question": "Bagaimana cara mengobati TBC?",
      "answer":
          "Terdiri dari dua fase: fase intensif (4–5 obat) dan fase lanjutan (2 obat), tergantung berat badan dan kondisi pasien."
    },
    {
      "question": "Apa yang harus dilakukan selama pengobatan TBC?",
      "answer":
          "Minum obat teratur, istirahat cukup, konsumsi makanan bergizi, dan periksa ulang dahak pada bulan ke-2, ke-5, dan ke-6."
    },
    {
      "question": "Bagaimana cara mencegah penularan TBC?",
      "answer":
          "Tutup mulut saat batuk, buang dahak di tempat tertutup, jaga kebersihan rumah, dan imunisasi BCG untuk bayi."
    },
    {
      "question": "Apa dampak TBC pada penderita?",
      "answer":
          "Menurunnya kondisi fisik, psikologis, sosial, spiritual, dan produktivitas akibat penyakit yang berkepanjangan."
    },
  ];

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
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: faqData.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = faqData[index];
          return ExpansionTile(
            title: Text(
              item['question']!,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  item['answer']!,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[800],
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
