import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // Import dari sub-folder pages

void main() {
  runApp(const SintaFloristApp());
}

class SintaFloristApp extends StatelessWidget {
  const SintaFloristApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sinta Florist Premium',
      theme: ThemeData(
        // Menggunakan skema warna yang lebih elegan (misal: ungu/merah muda tua)
        primarySwatch: Colors.pink,
        primaryColor: const Color(0xFFC70039),
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFC70039),
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFC70039),
        ),
      ),
      home: const LoginPage(),
    );
  }
}