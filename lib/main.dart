import 'package:flutter/material.dart';

void main() {
  runApp(Tes());
}

class Tes extends StatelessWidget {
  Tes({super.key});

  List<String> menu = ["Soto", "Rawon"];

  List<int> harga = [10000, 15000];

  List<String> gambar = ["assets/soto.jpg", "assets/rawon.jpg"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF7F5ED),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF718B70),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF718B70),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Menu Makanan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul daftar menu
              Text(
                "Daftar Menu",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4F6950),
                ),
              ),

              SizedBox(height: 16),

              // Tabel menu makanan
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1A718B70),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Table(
                      border: TableBorder.all(
                        color: Color(0xFFD8DFD2),
                        width: 1,
                      ),
                      columnWidths: {
                        0: FlexColumnWidth(0.6),
                        1: FlexColumnWidth(1.5),
                        2: FlexColumnWidth(1.4),
                        3: FlexColumnWidth(1.5),
                      },
                      children: [
                        // Header tabel
                        TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFF718B70),
                          ),
                          children: [
                            header("No"),
                            header("Gambar"),
                            header("Menu"),
                            header("Harga"),
                          ],
                        ),

                        // Data dari array
                        for (int i = 0; i < menu.length; i++)
                          TableRow(
                            decoration: BoxDecoration(
                              color: i % 2 == 0
                                  ? Color(0xFFF7F5ED)
                                  : Color(0xFFFFFDF8),
                            ),
                            children: [
                              cell(
                                Text(
                                  "${i + 1}",
                                  style: TextStyle(
                                    color: Color(0xFF796653),
                                  ),
                                ),
                              ),
                              cell(
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    gambar[i],
                                    width: 65,
                                    height: 65,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              cell(
                                Text(
                                  menu[i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4F6950),
                                  ),
                                ),
                              ),
                              cell(
                                Text(
                                  "Rp ${harga[i]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF718B70),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Footer
              Center(
                child: Text(
                  "♡ Made with love ♡",
                  style: TextStyle(
                    color: Color(0xFF718B70),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Desain header tabel
  Widget header(String teks) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 4,
      ),
      child: Text(
        teks,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  // Desain isi tabel
  Widget cell(Widget isi) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: isi,
      ),
    );
  }
}
