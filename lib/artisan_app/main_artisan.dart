import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ArtisanApp());
}

class ArtisanApp extends StatelessWidget {
  const ArtisanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handmade Egypt - Artisan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF12181F),
        primaryColor: const Color(0xFFB87733),
        fontFamily: 'Cairo',
      ),
      locale: const Locale('ar', 'EG'),
      home: const ArtisanHomeScreen(),
    );
  }
}

class ArtisanHomeScreen extends StatelessWidget {
  const ArtisanHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بوابة الحرفيين - إدارة الورشة', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15)),
        backgroundColor: const Color(0xFF12181F),
      ),
      body: const Center(
        child: Text('هنا واجهة إضافة المنتجات ومتابعة المحفظة للحرفي', style: TextStyle(color: Color(0xFFFEC7C2))),
      ),
    );
  }
}
