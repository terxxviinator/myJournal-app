import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const SettingsScreen({super.key, required this.onThemeChanged});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    final box = Hive.box('settings');
    isDarkMode = box.get('darkMode', defaultValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          // DARK MODE
          SwitchListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Aktifkan mode gelap"),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
              widget.onThemeChanged(value);
            },
          ),

          const Divider(),

          // ABOUT
          ListTile(
            title: const Text("Tentang Aplikasi"),
            subtitle: const Text("MyJournal v1.0.0"),
            leading: const Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
