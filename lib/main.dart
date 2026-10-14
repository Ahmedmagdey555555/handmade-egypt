import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HandmadeEgyptConsumerApp());
}

class HandmadeEgyptConsumerApp extends StatelessWidget {
  const HandmadeEgyptConsumerApp({super.key});

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
      home: const ConsumerHomeScreen(),
    );
  }
}

class ConsumerHomeScreen extends StatefulWidget {
  const ConsumerHomeScreen({super.key});

  @override
  State<ConsumerHomeScreen> createState() => _ConsumerHomeScreenState();
}

class _ConsumerHomeScreenState extends State<ConsumerHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ConsumerExploreTab(),
    const ConsumerOrdersTab(),
    const ConsumerProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text(
          'هاند ميد مصر - سوق التراث',
          style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF1E2630),
        selectedItemColor: const Color(0xFFB87733),
        unselectedItemColor: const Color(0xFF9E9E9E),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'المتجر',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }
}

// 1. تبويب المتجر والتصفح الرئيسي
class ConsumerExploreTab extends StatelessWidget {
  const ConsumerExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // بانر ترحيبي
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E2630),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFA97835).withOpacity(0.4)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اقتنِ أصالة الصنعة المصرية 🏺',
                style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                'منتجات يدوية خالصة بضمان الجودة، مباشرة من ورش الحرفيين إليك.',
                style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'أبرز المنتجات المعروضة',
          style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // قائمة المنتجات (سيتم ربطها لاحقاً بلوحة التحكم والسيرفر)
        const ProductCard(
          title: 'صينية نحاس أصلي مطقوق يدوياً',
          artisan: 'ورشة المعلم إبراهيم - خان الخليلي',
          price: '1,250 ج.م',
          rating: '4.9',
        ),
        const SizedBox(height: 12),
        const ProductCard(
          title: 'فازة فخار تراثي منقوش',
          artisan: 'أريج الفخار - الفيوم',
          price: '480 ج.م',
          rating: '4.7',
        ),
        const SizedBox(height: 12),
        const ProductCard(
          title: 'سجادة كليم يدوية الصنع',
          artisan: 'نسيج الأصالة - أسيوط',
          price: '2,100 ج.م',
          rating: '5.0',
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.artisan,
    required this.price,
    required this.rating,
  });

  final String title;
  final String artisan;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2630),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFA97835).withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF12181F),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFB87733).withOpacity(0.5)),
            ),
            child: const Icon(Icons.image_outlined, color: Color(0xFFB87733), size: 30),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 3),
                Text(artisan, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 10)),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price, style: const TextStyle(color: Color(0xFFB87733), fontWeight: FontWeight.bold, fontSize: 12)),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(rating, style: const TextStyle(color: Color(0xFFFEC7C2), fontSize: 11)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 2. تبويب الطلبات
class ConsumerOrdersTab extends StatelessWidget {
  const ConsumerOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('طلباتي الحالية والسابقة', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Center(
            child: Text('لا توجد طلبات نشطة حالياً. ابدأ التسوق الآن!', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

// 3. تبويب الحساب الشخصي
class ConsumerProfileTab extends StatelessWidget {
  const ConsumerProfileTab({super.key});

  @override
  Widget main(BuildContext context) => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('حساب العميل', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.location_on_outlined, color: Color(0xFFB87733)),
            title: Text('عناوين الشحن', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 13)),
            subtitle: Text('إدارة عناوين التوصيل الخاصة بك', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 10)),
          ),
          ListTile(
            leading: Icon(Icons.support_agent_outlined, color: Color(0xFFB87733)),
            title: Text('خدمة العملاء والدعم', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 13)),
            subtitle: Text('تواصل معنا لأي استفسار أو شكوى', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 10)),
          ),
        ],
      ),
    );
  }
}
