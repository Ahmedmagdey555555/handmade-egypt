import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ConsumerApp());
}

class ConsumerApp extends StatelessWidget {
  const ConsumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handmade Egypt - Consumer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF12181F),
        primaryColor: const Color(0xFFB87733),
        fontFamily: 'Cairo',
      ),
      locale: const Locale('ar', 'EG'),
      home: const ConsumerHomeScreen(),
    );
  }
}

class ConsumerHomeScreen extends StatelessWidget {
  const ConsumerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق العملاء - هاند ميد مصر', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15)),
        backgroundColor: const Color(0xFF12181F),
      ),
      body: const Center(
        child: Text('هنا واجهة تصفح المنتجات والشراء للعملاء', style: TextStyle(color: Color(0xFFFEC7C2))),
      ),
    );
  }
}
