import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/journal_model.dart';
import 'screens/splash.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(JournalAdapter());
  await Hive.openBox<Journal>('journals');
  await Hive.openBox('settings'); // 🔑 untuk dark mode

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    final box = Hive.box('settings');
    isDarkMode = box.get('darkMode', defaultValue: false);
  }

  void toggleTheme(bool value) {
    final box = Hive.box('settings');
    box.put('darkMode', value);

    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: SplashScreen(onThemeChanged: toggleTheme),
    );
  }
}
