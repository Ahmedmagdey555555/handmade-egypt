import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/main_navigation_screen.dart'; // تأكد من استيراد شاشة التنقل الرئيسية

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HandmadeEgyptApp());
}

class HandmadeEgyptApp extends StatelessWidget {
  const HandmadeEgyptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handmade Egypt',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      locale: const Locale('ar', 'EG'), // البدء باللغة العربية كافتراضي
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      home: const SplashScreen(),
    );
  }
}

// شاشة الترحيب (Splash Screen) مع شعار H&E
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // الانتقال بعد 3 ثوانٍ للشاشة الرئيسية (MainNavigationScreen)
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkSlate,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة / شعار متقن H&E
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.antiqueGold, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.copper.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'H&E',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.creamIvory,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Handmade Egypt',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.creamIvory,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'تحفة فنية تُروى بحرفية مصرية أصيلة',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 32),
            const CircularProgressIndicator(
              color: AppColors.copper,
            ),
          ],
        ),
      ),
    );
  }
}
