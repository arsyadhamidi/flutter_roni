import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roni_api/ui/history/history_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  String formatDateTime(String dateTimeStr) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeStr);
      return DateFormat('dd MMM yyyy, HH:mm:ss').format(dateTime);
    } catch (e) {
      return dateTimeStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryProvider(),
      child: Consumer<HistoryProvider>(
        builder: (context, historyProvider, child) {
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
            body: RefreshIndicator(
              onRefresh: historyProvider.fetchHistory,
              child: historyProvider.isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.grey.shade200)),
                              color: Colors.white,
                              child: ListTile(
                                leading: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                title: Container(
                                  width: double.infinity,
                                  height: 14,
                                  color: Colors.grey[300],
                                ),
                                subtitle: Container(
                                  width: 150,
                                  height: 10,
                                  margin: EdgeInsets.only(top: 6),
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : historyProvider.listHistory == null ||
                          historyProvider.listHistory!.isEmpty
                      ? Center(
                          child: Text(
                            'No history data available',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          itemCount: historyProvider.listHistory!.length,
                          itemBuilder: (context, index) {
                            final history = historyProvider.listHistory![index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              margin: EdgeInsets.only(bottom: 12),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.http, color: Colors.green),
                                        SizedBox(width: 8),
                                        Text(
                                          history.method ?? '',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            history.url ?? '',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(height: 8),
                                    // Text(
                                    //   'IP: ${history.ipAddress ?? 'Unknown'}',
                                    //   style: GoogleFonts.poppins(
                                    //     fontSize: 12,
                                    //     color: Colors.grey[700],
                                    //   ),
                                    // ),
                                    // SizedBox(height: 4),
                                    // Text(
                                    //   'User Agent: ${history.userAgent ?? 'Unknown'}',
                                    //   style: GoogleFonts.poppins(
                                    //     fontSize: 12,
                                    //     color: Colors.grey[700],
                                    //   ),
                                    // ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Date: ${formatDateTime(history.createdAt?.toIso8601String() ?? '')}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          );
        },
      ),
    );
  }
}
