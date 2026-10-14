import 'package:flutter/material.dart';

// =====================================================================
// 1. التطبيق الرئيسي للتاجر (Artisan App Entry)
// =====================================================================
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
      home: const ArtisanMainScreen(),
    );
  }
}

// =====================================================================
// 2. شريط التنقل الرئيسي للتاجر
// =====================================================================
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
    const ArtisanWalletTab(),
    const ArtisanProfileTab(),
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
              label: 'الطلبات الخاصة',
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

// =====================================================================
// 3. لوحة تحكم الحرفي (Home Tab)
// =====================================================================
class ArtisanHomeTab extends StatelessWidget {
  const ArtisanHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text(
          'لوحة تحكم الورشة - Handmade Egypt',
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
                          'حساب معتمد - ضمان الـ 3 أشهر مفعل بجميع المنتجات',
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
              'نظرة سريعة على المبيعات',
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

// =====================================================================
// 4. تبويب منتجاتي وإضافة منتج جديد
// =====================================================================
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFB87733),
        child: const Icon(Icons.add, color: Color(0xFF12181F)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ArtisanAddProductScreen()),
          );
        },
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
                      Text('السعر: 1,850 ج.م | ضمان Handmade Egypt', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 10)),
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

// شاشة إضافة منتج يدوي مع اعتماد ضمان هاند ميد
class ArtisanAddProductScreen extends StatefulWidget {
  const ArtisanAddProductScreen({super.key});

  @override
  State<ArtisanAddProductScreen> createState() => _ArtisanAddProductScreenState();
}

class _ArtisanAddProductScreenState extends State<ArtisanAddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('إضافة منتج تراثي جديد', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 15)),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2630),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'سيتم تفعيل ضمان الـ 3 أشهر (ضمان Handmade Egypt) تلقائياً على المنتج فور نشره.',
                  style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11),
                ),
              ),
              const SizedBox(height: 20),
              const Text('اسم القطعة الفنية', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _titleController,
                style: const TextStyle(color: Color(0xFFF5F5F5)),
                decoration: InputDecoration(
                  hintText: 'مثال: شنطة جلد طبيعي مطرزة',
                  filled: true,
                  fillColor: const Color(0xFF1E2630),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
                validator: (value) => value!.isEmpty ? 'يرجى إدخال اسم المنتج' : null,
              ),
              const SizedBox(height: 16),
              const Text('السعر (ج.م)', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Color(0xFFF5F5F5)),
                decoration: InputDecoration(
                  hintText: 'مثال: 2450',
                  filled: true,
                  fillColor: const Color(0xFF1E2630),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
                validator: (value) => value!.isEmpty ? 'يرجى إدخال السعر' : null,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB87733),
                    foregroundColor: const Color(0xFF12181F),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم إضافة المنتج وإرساله لإدارة المنصة بنجاح!')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('نشر المنتج وتفعيل الضمان', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================================
// 5. تبويب الطلبات الخاصة (مع إرسال العرض للإدارة وليس للعميل)
// =====================================================================
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
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('طلب تفصيل حقيبة جلد أصلي مقاس خاص', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 6),
              const Text('الحالة: في انتظار تقديم السعر لإدارة المنصة', style: TextStyle(color: Color(0xFFB87733), fontSize: 11)),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB87733),
                    foregroundColor: const Color(0xFF12181F),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم إرسال تكلفة التنفيذ للإدارة للمراجعة.')),
                    );
                  },
                  child: const Text('تقديم التكلفة للإدارة', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================================
// 6. تبويب المحفظة والماليات المفصلة
// =====================================================================
class ArtisanWalletTab extends StatelessWidget {
  const ArtisanWalletTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('محفظة الحرفي والماليات', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFB87733), Color(0xFFA97835)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('الرصيد القابل للسحب (مستحقاتك)', style: TextStyle(color: Color(0xFF12181F), fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('11,400 ج.م', style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF12181F),
                      foregroundColor: const Color(0xFFFEC7C2),
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم طلب سحب الأرباح لمحافظ المحمول بنجاح.')),
                      );
                    },
                    child: const Text('سحب الأرباح (محفظة كاش)', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('تفصيل الإيرادات والحسابات', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  FinancialRow(title: 'إجمالي مبيعات الطلبات', amount: '14,000 ج.م', color: Color(0xFFF5F5F5)),
                  Divider(color: Color(0xFF9E9E9E), height: 16),
                  FinancialRow(title: 'صافي مستحقات الحرفي', amount: '11,400 ج.م', color: Color(0xFFB87733)),
                  SizedBox(height: 8),
                  FinancialRow(title: 'عمولة تشغيل المنصة', amount: '2,100 ج.م', color: Color(0xFFA97835)),
                  SizedBox(height: 8),
                  FinancialRow(title: 'مبالغ التوصيل والشحن', amount: '500 ج.م', color: Color(0xFF2E7D32)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinancialRow extends StatelessWidget {
  const FinancialRow({super.key, required this.title, required this.amount, required this.color});
  final String title;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
        Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }
}

// =====================================================================
// 7. تبويب حساب التاجر
// =====================================================================
class ArtisanProfileTab extends StatelessWidget {
  const ArtisanProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('حساب الورشة', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)),
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
