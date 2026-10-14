import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handmade Egypt - Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF12181F),
        primaryColor: const Color(0xFFB87733),
        fontFamily: 'Cairo',
      ),
      locale: const Locale('ar', 'EG'),
      home: const AdminHomeScreen(),
    );
  }
}

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة تحكم الإدارة الشاملة', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15)),
        backgroundColor: const Color(0xFF12181F),
      ),
      body: const Center(
        child: Text('هنا لوحة التحكم لمراجعة المنتجات وقبول الحرفيين', style: TextStyle(color: Color(0xFFFEC7C2))),
      ),
    );
  }
}
