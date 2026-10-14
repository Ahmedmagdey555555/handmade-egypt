import 'package:flutter/material.dart';
import 'artisan_wallet_screen.dart'; // سنقوم بإنشاء ملف المحفظة أيضاً

class ArtisanMainScreen extends StatefulWidget {
  const ArtisanMainScreen({super.key});

  @override
  State<ArtisanMainScreen> createState() => _ArtisanMainScreenState();
}

class _ArtisanMainScreenState extends State<ArtisanMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ArtisanHomeTab(),
    const ArtisanProductsTab(),
    const ArtisanOrdersTab(),
    const ArtisanWalletScreen(), // شاشة المحفظة المفصلة للأرباح والتوصيل
    const ArtisanProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F), // Dark Slate
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
          backgroundColor: const Color(0xFF1E2630), // Card Surface
          selectedItemColor: const Color(0xFFB87733),  // Copper
          unselectedItemColor: const Color(0xFF9E9E9E),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          unselectedLabelStyle: const TextStyle(fontSize: 9),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              activeIcon: Icon(Icons.dashboard),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              activeIcon: Icon(Icons.inventory_2),
              label: 'منتجاتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in_outlined),
              activeIcon: Icon(Icons.assignment_turned_in),
              label: 'الطلبات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              activeIcon: Icon(Icons.account_balance_wallet),
              label: 'المحفظة',
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

// 1. تبويب الرئيسية
class ArtisanHomeTab extends StatelessWidget {
  const ArtisanHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text(
          'لوحة تحكم الحرفي - Giza Hub',
          style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFA97835).withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.verified, color: Color(0xFFB87733), size: 36),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'ورشة الحرفي المصري',
                          style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'حساب معتمد رسمياً - ضمان الـ 3 أشهر مفعل',
                          style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'نظرة سريعة',
              style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: StatCard(title: 'المبيعات الكلية', value: '14,000 ج.م', icon: Icons.trending_up),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(title: 'طلبات قيد التنفيذ', value: '3 طلبات', icon: Icons.hourglass_top),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.title, required this.value, required this.icon});
  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2630),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFB87733), size: 20),
          const SizedBox(height: 10),
          Text(value, style: const TextStyle(color: Color(0xFFFEC7C2), fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 10)),
        ],
      ),
    );
  }
}

// 2. تبويب منتجاتي
class ArtisanProductsTab extends StatelessWidget {
  const ArtisanProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('منتجات الورشة', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2630),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF12181F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image, color: Color(0xFF9E9E9E)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('صندوق خشب زان مطعم', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
                      SizedBox(height: 4),
                      Text('السعر: 1,850 ج.م | ضمان 3 أشهر', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 3. تبويب الطلبات الخاصة
class ArtisanOrdersTab extends StatelessWidget {
  const ArtisanOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('طلبات التصميم الخاصة', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF1E2630),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('طلب تفصيل حقيبة جلد أصلي', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
              SizedBox(height: 6),
              Text('الحالة: في انتظار تقديم عرض السعر للعميل', style: TextStyle(color: Color(0xFFB87733), fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}

// 5. تبويب حساب الحرفي
class ArtisanProfileTab extends StatelessWidget {
  const ArtisanProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('حساب الحرفي', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
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
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text('تسجيل الخروج من تطبيق التجار', style: TextStyle(color: Colors.redAccent, fontSize: 13)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
