import 'package:flutter/material.dart';

// ==========================================
// 1. ألوان وثيم التطبيق (App Colors & Theme)
// ==========================================
class AppColors {
  static const Color copper = Color(0xFFB87733);       // اللون النحاسي الأساسي
  static const Color antiqueGold = Color(0xFFA97835);  // الذهبي العتيق
  static const Color emeraldGreen = Color(0xFF1E5631); // الأخضر الزمردي الملكي
  static const Color creamIvory = Color(0xFFFEC7C2);   // الكريمي / العاجي الهادئ
  
  static const Color darkSlate = Color(0xFF12181F);    // الخلفية الداكنة الفخمة
  static const Color cardSurface = Color(0xFF1E2630);  // لون الكروت والبطاقات الداكنة
  static const Color textLight = Color(0xFFF5F5F5);    // النصوص الفاتحة الواضحة
  static const Color textMuted = Color(0xFF9E9E9E);    // النصوص الفرعية
  
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
      fontFamily: 'Cairo',
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

// ==========================================
// 2. نقطة بداية التطبيق (Main & Splash)
// ==========================================
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
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      home: const HomeScreen(),
    );
  }
}

// ==========================================
// 3. الشاشة الرئيسية (Home Screen)
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkSlate,
      appBar: AppBar(
        title: const Text(
          'Handmade Egypt',
          style: TextStyle(color: AppColors.creamIvory, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: AppColors.copper),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: AppColors.copper),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 شريط البحث الذكي
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.cardSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.antiqueGold.withOpacity(0.3)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'ابحث عن قطع فنية، جلود، فخار، تطريز...',
                    hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14),
                    icon: Icon(Icons.search, color: AppColors.copper),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 🎨 بانر العروض والمواسم
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.copper, AppColors.emeraldGreen.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'إبداعات التراث المصري',
                        style: TextStyle(
                          color: AppColors.creamIvory,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'قطع مصنوعة يدوياً بحرفية مطلقة ومعتمدة من Giza Hub',
                        style: TextStyle(color: AppColors.textLight, fontSize: 12),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkSlate,
                          foregroundColor: AppColors.creamIvory,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        onPressed: () {},
                        child: const Text('اطلب تصميمك الخاص', style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 📂 فئات المنتجات
              const Text(
                'التصنيفات',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.creamIvory,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryItem(title: 'أزياء وملابس', icon: Icons.checkroom),
                    CategoryItem(title: 'جلود طبيعية', icon: Icons.wallet),
                    CategoryItem(title: 'فخار وخزف', icon: Icons.local_florist),
                    CategoryItem(title: 'مفروشات', icon: Icons.weekend),
                    CategoryItem(title: 'حلي ومجوهرات', icon: Icons.diamond),
                    CategoryItem(title: 'ديكور منزلي', icon: Icons.home),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 🔥 القطع المميزة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween

                children: const [
                  Text(
                    'القطع المميزة',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.creamIvory,
                    ),
                  ),
                  Text(
                    'عرض الكل',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.copper,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // شبكة عرض المنتجات
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.68,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// عنصر الفئة
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.cardSurface,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.copper.withOpacity(0.5)),
            ),
            child: Icon(icon, color: AppColors.copper, size: 28),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(color: AppColors.textLight, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

// بطاقة المنتج
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.antiqueGold.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, color: AppColors.textMuted, size: 40),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.antiqueGold,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Giza Hub Verified',
                      style: TextStyle(fontSize: 8, color: AppColors.darkSlate, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'شنطة جلد طبيعي مطرزة',
                  style: TextStyle(color: AppColors.creamIvory, fontSize: 13, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                const Text(
                  '2,450 ج.م',
                  style: TextStyle(color: AppColors.copper, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                // 🛡️ فترة الضمان واسم التطبيق في سطر واحد تحت صورة المنتج
                const Text(
                  'ضمان 3 أشهر - Handmade Egypt',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
