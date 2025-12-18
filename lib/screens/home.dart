import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/journal_model.dart';
import 'add_journal.dart';
import 'detail.dart';
import 'settings.dart';

class Home extends StatelessWidget {
  final Function(bool) onThemeChanged;
  const Home({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        title: Text(
          "MyJournal",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      SettingsScreen(onThemeChanged: onThemeChanged),
                ),
              );
            },
          ),
        ],
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
                color: Theme.of(context).cardColor,
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
                            color: Theme.of(context).colorScheme.primary,
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
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddJournalScreen(),
                    ),
                  );
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
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 12),

            ValueListenableBuilder(
              valueListenable: Hive.box<Journal>('journals').listenable(),
              builder: (context, Box<Journal> box, _) {
                if (box.isEmpty) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
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
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,

                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final journal = box.getAt(index)!;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Text(
                          journal.mood,
                          style: const TextStyle(fontSize: 24),
                        ),
                        title: Text(journal.title),
                        subtitle: Text(
                          "${journal.date.day}/${journal.date.month}/${journal.date.year}",
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetailJournalScreen(journal: journal),
                            ),
                          );
                        },

                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red.shade400),
                          onPressed: () {
                            _showDeleteDialog(context, box, index);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _showDeleteDialog(BuildContext context, Box<Journal> box, int index) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Hapus Jurnal"),
      content: const Text("Apakah kamu yakin ingin menghapus jurnal ini?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Batal"),
        ),
        TextButton(
          onPressed: () {
            box.deleteAt(index);
            Navigator.pop(context);
          },
          child: const Text("Hapus", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}
