import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HandmadeEgyptApp());
}

// =====================================================================
// 1. التطبيق الأساسي والثيم
// =====================================================================
class HandmadeEgyptApp extends StatelessWidget {
  const HandmadeEgyptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handmade Egypt',
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
      home: const SplashScreen(),
    );
  }
}

// =====================================================================
// 2. شاشة البداية (Splash Screen)
// =====================================================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
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
      backgroundColor: const Color(0xFF12181F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFA97835), width: 2),
              ),
              child: const Center(
                child: Text(
                  'H&E',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFFEC7C2)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Handmade Egypt',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFEC7C2)),
            ),
            const SizedBox(height: 12),
            const Text(
              'تحفة فنية تُروى بحرفية مصرية أصيلة',
              style: TextStyle(fontSize: 13, color: Color(0xFF9E9E9E)),
            ),
            const SizedBox(height: 32),
            const CircularProgressIndicator(color: Color(0xFFB87733)),
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// 3. التنقل الرئيسي (Main Navigation)
// =====================================================================
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CustomOrderScreen(),
    const OrderTrackingScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: const Color(0xFFA97835).withOpacity(0.2), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color(0xFF1E2630),
          selectedItemColor: const Color(0xFFB87733),
          unselectedItemColor: const Color(0xFF9E9E9E),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.design_services_outlined),
              activeIcon: Icon(Icons.design_services),
              label: 'طلب خاص',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping_outlined),
              activeIcon: Icon(Icons.local_shipping),
              label: 'التتبع',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// 4. الشاشة الرئيسية (Home Screen)
// =====================================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text(
          'Handmade Egypt',
          style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFFB87733)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بانر ترحيبي
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFB87733), Color(0xFFA97835)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تراثنا المصري بلمسة معاصرة',
                          style: TextStyle(color: Color(0xFF12181F), fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'تسوق أجمل الحرف اليدوية المعتمدة مع ضمان هاند ميد إيجيبت لمدة 3 أشهر.',
                          style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.star, color: Color(0xFFFEC7C2), size: 40),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'أبرز المنتجات اليدوية',
              style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            // بطاقة منتج تجريبية تؤدي لتفاصيل المنتج
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductDetailsScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2630),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFA97835).withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF12181F),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.image, color: Color(0xFF9E9E9E)),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('حقيبة جلد طبيعي مطرزة', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(height: 4),
                          Text('السعر: 2,450 ج.م', style: TextStyle(color: Color(0xFFB87733), fontSize: 12, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('ضمان 3 أشهر - Handmade Egypt', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 10)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Color(0xFF9E9E9E), size: 14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// 5. شاشة تفاصيل المنتج ودفع المحفظة (Product Details Screen)
// =====================================================================
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('تفاصيل المنتج', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(Icons.image, size: 80, color: Color(0xFF9E9E9E)),
              ),
            ),
            const SizedBox(height: 20),
            const Text('حقيبة جلد طبيعي مطرزة يدوياً', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('2,450 ج.م', style: TextStyle(color: Color(0xFFB87733), fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('قصة الصنعة والوصف:', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
              'صُنعت هذه الحقيبة بالكامل يدوياً باستخدام أجود أنواع الجلد الطبيعي المصري وتطريز تراثي أصيل مع ضمان كامل لمدة 3 أشهر.',
              style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 13, height: 1.4),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB87733),
                  foregroundColor: const Color(0xFF12181F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم تأكيد الطلب والدفع عبر المحفظة بنجاح!')),
                  );
                },
                child: const Text('إتمام الشراء (الدفع بمحفظة كاش)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// 6. شاشة الطلبات الخاصة (Custom Order Screen)
// =====================================================================
class CustomOrderScreen extends StatelessWidget {
  const CustomOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('طلب تصميم خاص', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('أرسل فكرتك وسنقوم بتنفيذها بدقة', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              maxLines: 4,
              style: const TextStyle(color: Color(0xFFF5F5F5)),
              decoration: InputDecoration(
                hintText: 'اكتب تفاصيل الفكرة أو المقاسات المطلوبة...',
                hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
                filled: true,
                fillColor: const Color(0xFF1E2630),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB87733),
                  foregroundColor: const Color(0xFF12181F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم إرسال طلبك للإدارة للمراجعة والرد خلال 24 ساعة.')),
                  );
                },
                child: const Text('إرسال الطلب الخاص للإدارة', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// 7. شاشة تتبع الشحنة (Order Tracking Screen)
// =====================================================================
class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('تتبع الشحنة', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('رقم الطلب: #HE-1049', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
                  Text('قيد التوصيل', style: TextStyle(color: Color(0xFFB87733), fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// 8. شاشة الحساب والملف الشخصي (Account Screen)
// =====================================================================
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('حسابي', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              tileColor: const Color(0xFF1E2630),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              leading: const Icon(Icons.delete_forever, color: Colors.redAccent),
              title: const Text('حذف الحساب والبيانات نهائياً', style: TextStyle(color: Colors.redAccent, fontSize: 13)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
