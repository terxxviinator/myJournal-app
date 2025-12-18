import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/journal_model.dart';

class AddJournalScreen extends StatefulWidget {
  final Journal? journal;
  final int? index;

  const AddJournalScreen({super.key, this.journal, this.index});

  @override
  State<AddJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<AddJournalScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  String selectedMood = "😊";

  @override
  void initState() {
    super.initState();

    if (widget.journal != null) {
      _titleController.text = widget.journal!.title;
      _contentController.text = widget.journal!.content;
      selectedMood = widget.journal!.mood;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue.shade400),
        title: Text(
          widget.journal == null ? "Tambah Jurnal" : "Edit Jurnal",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // JUDUL
            Text(
              "Judul",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Masukkan judul jurnal",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ISI JURNAL
            Text(
              "Isi Jurnal",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: _contentController,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Tulis ceritamu hari ini...",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // MOOD
            Text(
              "Mood Hari Ini",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ["😊", "😐", "😢", "😡", "😍"].map((mood) {
                final isSelected = selectedMood == mood;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMood = mood;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.blue.shade100
                          : Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Text(mood, style: const TextStyle(fontSize: 22)),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 40),

            // BUTTON SIMPAN
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_titleController.text.isEmpty ||
                      _contentController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Judul dan isi jurnal tidak boleh kosong",
                        ),
                      ),
                    );
                    return;
                  }

                  final box = Hive.box<Journal>('journals');

                  if (widget.journal == null) {
                    // CREATE
                    final newJournal = Journal(
                      title: _titleController.text,
                      content: _contentController.text,
                      mood: selectedMood,
                      date: DateTime.now(),
                    );
                    await box.add(newJournal);
                  } else {
                    // EDIT
                    final updatedJournal = Journal(
                      title: _titleController.text,
                      content: _contentController.text,
                      mood: selectedMood,
                      date: widget.journal!.date,
                    );
                    await box.putAt(widget.index!, updatedJournal);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Jurnal berhasil disimpan")),
                  );

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Simpan Jurnal",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
