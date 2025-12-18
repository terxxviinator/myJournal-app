import 'package:flutter/material.dart';
import '../models/journal_model.dart';
import 'add_journal.dart';

class DetailJournalScreen extends StatelessWidget {
  final Journal journal;

  const DetailJournalScreen({super.key, required this.journal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue.shade400),
        title: Text(
          "Detail Jurnal",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddJournalScreen(
                    journal: journal,
                    index: journal.key as int,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MOOD
            Center(
              child: Text(journal.mood, style: const TextStyle(fontSize: 48)),
            ),

            const SizedBox(height: 20),

            // JUDUL
            Text(
              journal.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // TANGGAL
            Text(
              "${journal.date.day}/${journal.date.month}/${journal.date.year}",
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 20),

            // ISI
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                journal.content,
                style: const TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
