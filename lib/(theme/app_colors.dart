import 'package:flutter/material.dart';

class AppColors {
  // Primary & Secondary Brand Colors
  static const Color copper = Color(0xFFB87733);       // اللون النحاسي الأساسي
  static const Color antiqueGold = Color(0xFFA97835);  // الذهبي العتيق
  static const Color emeraldGreen = Color(0xFF1E5631); // الأخضر الزمردي الملكي
  static const Color creamIvory = Color(0xFFFEC7C2);   // الكريمي / العاجي الهادئ
  
  // Background & Surface Colors (Dark Slate Theme)
  static const Color darkSlate = Color(0xFF12181F);    // الخلفية الداكنة الفخمة
  static const Color cardSurface = Color(0xFF1E2630);  // لون الكروت والبطاقات الداكنة
  static const Color textLight = Color(0xFFF5F5F5);    // النصوص الفاتحة الواضحة
  static const Color textMuted = Color(0xFF9E9E9E);    // النصوص الفرعية
  
  // Status Colors
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFC62828);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkSlate,
      primaryColor: AppColors.copper,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.copper,
        secondary: AppColors.antiqueGold,
        surface: AppColors.cardSurface,
        error: AppColors.error,
      ),
      fontFamily: 'Cairo', // مناسب جداً للتوجه العربي/الإنجليزي الفخم
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkSlate,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.creamIvory,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.cardSurface,
        selectedItemColor: AppColors.copper,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
