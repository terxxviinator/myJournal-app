import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "MyJournal",
          style: TextStyle(
            color: Colors.blue.shade400,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER SECTION
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Icon / ilustrasi
                  Icon(
                    Icons.edit_note_rounded,
                    size: 70,
                    color: Colors.blue.shade300,
                  ),
                  const SizedBox(width: 20),

                  // Text intro
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Mulai mencatat perjalanan harianmu dan kelola jurnal dengan mudah.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // CARD PERKENALAN
            Text(
              "Tentang MyJournal",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade400,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Text(
                "MyJournal adalah aplikasi jurnal pribadi sederhana yang membantumu mencatat aktivitas, perasaan, dan pengalaman harian. "
                "Aplikasi ini dirancang minimalis, ringan, dan mudah digunakan.",
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
            ),

            const SizedBox(height: 30),

            // BUTTON CREATE JOURNAL
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Arahkan ke screen Create Journal
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Buat Jurnal Baru",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // SECTION LIST JURNAL
            Text(
              "Jurnal Terbaru",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade400,
              ),
            ),

            const SizedBox(height: 12),

            // Empty state untuk journal list
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    size: 50,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Belum ada jurnal.\nMulai buat catatan pertamamu!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
