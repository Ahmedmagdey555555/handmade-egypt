import 'package:flutter/material.dart';
import 'app_selector_screen.dart'; // استيراد شاشة الاختيار

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const EcosystemLauncherApp());
}

class EcosystemLauncherApp extends StatelessWidget {
  const EcosystemLauncherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handmade Egypt Ecosystem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF12181F),
        primaryColor: const Color(0xFFB87733),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFB87733),
          secondary: Color(0xFFA97835),
          surface: Color(0xFF1E2630),
        ),
        fontFamily: 'Cairo',
      ),
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      home: const AppSelectorScreen(), // العرض الأساسي للشاشة الحاضنة
    );
  }
}
