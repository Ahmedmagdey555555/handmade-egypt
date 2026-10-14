import 'package:flutter/material.dart';

void main() {
  runApp(const HandmadeEgyptApp());
}

const Color forestGreen = Color(0xFF173D30);
const Color gold = Color(0xFFC6A45C);
const Color cream = Color(0xFFFAF6EE);
const Color charcoal = Color(0xFF292929);

class HandmadeEgyptApp extends StatefulWidget {
  const HandmadeEgyptApp({super.key});

  @override
  State<HandmadeEgyptApp> createState() => _HandmadeEgyptAppState();
}

class _HandmadeEgyptAppState extends State<HandmadeEgyptApp> {
  bool isArabic = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Handmade Egypt',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: forestGreen,
          primary: forestGreen,
          secondary: gold,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: forestGreen,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: Directionality(
        textDirection:
            isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: HomeScreen(
          isArabic: isArabic,
          onLanguageChanged: () {
            setState(() {
              isArabic = !isArabic;
            });
          },
        ),
      ),
    );
  }
}

class Product {
  final String nameAr;
  final String nameEn;
  final String categoryAr;
  final String categoryEn;
  final int price;
  final IconData icon;

  const Product({
    required this.nameAr,
    required this.nameEn,
    required this.categoryAr,
    required this
