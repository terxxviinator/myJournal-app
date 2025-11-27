import 'package:flutter/material.dart';
import 'home.dart'; // ganti sesuai nama file tujuan kamu

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();

    // Animasi Fade-in
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _opacityAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    // Auto navigate setelah 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Home()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) =>
              Opacity(opacity: _opacityAnim.value, child: child),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo berbentuk icon buku
              Icon(
                Icons.book_rounded,
                size: 80,
                color: Colors.blue.shade300, // biru pastel
              ),

              const SizedBox(height: 12),

              // Teks MyJournal
              Text(
                "MyJournal",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
