// =====================================================================
// لوحة تحكم الإدارة الشاملة (Admin Dashboard) - مدمجة للتشغيل الفوري
// =====================================================================
class AdminDashboardApp extends StatelessWidget {
  const AdminDashboardApp({super.key});

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
      home: const AdminMainScreen(),
    );
  }
}

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AdminHomeTab(),
    const AdminProductsReviewTab(),
    const AdminCustomOrdersTab(),
    const AdminArtisansManagementTab(),
    const AdminShippingTab(),
    const AdminFinancialsTab(),
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
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
          unselectedLabelStyle: const TextStyle(fontSize: 8),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings_outlined), activeIcon: Icon(Icons.admin_panel_settings), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.verified_outlined), activeIcon: Icon(Icons.verified), label: 'المنتجات'),
            BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), activeIcon: Icon(Icons.assignment), label: 'طلبات خاصة'),
            BottomNavigationBarItem(icon: Icon(Icons.handyman_outlined), activeIcon: Icon(Icons.handyman), label: 'الحرفيين'),
            BottomNavigationBarItem(icon: Icon(Icons.local_shipping_outlined), activeIcon: Icon(Icons.local_shipping), label: 'الشحن والتوصيل'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_outlined), activeIcon: Icon(Icons.account_balance), label: 'الماليات'),
          ],
        ),
      ),
    );
  }
}

class AdminHomeTab extends StatelessWidget {
  const AdminHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('لوحة تحكم الإدارة - Handmade Egypt', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold)),
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
                children: const [
                  Icon(Icons.security, color: Color(0xFFB87733), size: 36),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('إدارة النظام المركزية', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('مراقبة الحرفيين، الشحنات، فحص المنتجات، وضمان الـ 3 أشهر', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('إحصائيات المنصة العامة', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(child: AdminStatCard(title: 'إجمالي المبيعات', value: '45,200 ج.م', icon: Icons.trending_up)),
                SizedBox(width: 12),
                Expanded(child: AdminStatCard(title: 'شحنات قيد التوصيل', value: '12 شحنة', icon: Icons.local_shipping)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AdminStatCard extends StatelessWidget {
  const AdminStatCard({super.key, required this.title, required this.value, required this.icon});
  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFF1E2630), borderRadius: BorderRadius.circular(12)),
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

class AdminProductsReviewTab extends StatelessWidget {
  const AdminProductsReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(title: const Text('مراجعة المنتجات الجديدة', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)), backgroundColor: const Color(0xFF12181F), elevation: 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: const Color(0xFF1E2630), borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('صندوق خشب زان مطعم بالنحاس', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                const Text('الحرفي: ورشة الأصول التراثية | السعر: 1,850 ج.م', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.redAccent),
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم رفض المنتج.'))),
                      child: const Text('رفض', style: TextStyle(fontSize: 11)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB87733), foregroundColor: const Color(0xFF12181F)),
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم اعتماد ونشر المنتج وتفعيل ضمان Handmade Egypt!'))),
                      child: const Text('اعتماد ونشر', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AdminCustomOrdersTab extends StatelessWidget {
  const AdminCustomOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(title: const Text('إدارة الطلبات الخاصة', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)), backgroundColor: const Color(0xFF12181F), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: const Color(0xFF1E2630), borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('طلب شنطة جلد مقاس خاص من العميل أحمد', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 6),
              const Text('عرض التاجر المستلم: 3,200 ج.م (خلال 7 أيام)', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB87733), foregroundColor: const Color(0xFF12181F)),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم إرسال السعر واعتماد الطلب للعميل بدون تواصل مباشر.'))),
                  child: const Text('اعتماد السعر وإرساله للعميل', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminArtisansManagementTab extends StatelessWidget {
  const AdminArtisansManagementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(title: const Text('إدارة الحرفيين والورش', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)), backgroundColor: const Color(0xFF12181F), elevation: 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: const Color(0xFF1E2630), borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const Icon(Icons.store, color: Color(0xFFB87733), size: 30),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ورشة الأصول التراثية للجلود', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
                      SizedBox(height: 4),
                      Text('الحالة: نشط ومعتمد | المحفظة: 11,400 ج.م', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 10)),
                    ],
                  ),
                ),
                Switch(
                  value: true,
                  activeColor: const Color(0xFFB87733),
                  onChanged: (val) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم تحديث حالة الورشة بنجاح.'))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AdminShippingTab extends StatelessWidget {
  const AdminShippingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(title: const Text('سيستم شركات الشحن والتوصيل', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)), backgroundColor: const Color(0xFF12181F), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFA97835).withOpacity(0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.between,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('شركة الشحن المعتمدة', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
                      SizedBox(height: 4),
                      Text('Egypt Express Logistics', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
                    ],
                  ),
                  Text('متصل (API Active)', style: TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.bold, fontSize: 11)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('الشحنات الجارية وتعيين المناديب', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: const Color(0xFF1E2630), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('شحنة رقم #HE-1049 (من ورشة الجلود إلى العميل)', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 6),
                  const Text('حالة الشحنة: تم الاستلام من الحرفي - في الطريق للتوصيل', style: TextStyle(color: Color(0xFFB87733), fontSize: 11)),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 38,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB87733), foregroundColor: const Color(0xFF12181F)),
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم تحديث بوليصة الشحنة وإشعار العميل بنجاح.'))),
                      child: const Text('تحديث بوليصة الشحنة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminFinancialsTab extends StatelessWidget {
  const AdminFinancialsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(title: const Text('الماليات وإدارة العمولات', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold)), backgroundColor: const Color(0xFF12181F), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFB87733), Color(0xFFA97835)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('إجمالي أرباح وعمولات المنصة', style: TextStyle(color: Color(0xFF12181F), fontSize: 12, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('6,780 ج.م', style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 26, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('توزيع العمولات والمدفوعات', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF1E2630), borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: const [
                  AdminFinancialRow(title: 'إجمالي مبيعات المنصة', amount: '45,200 ج.م', color: Color(0xFFF5F5F5)),
                  Divider(color: Color(0xFF9E9E9E), height: 16),
                  AdminFinancialRow(title: 'مستحقات الحرفيين المعلقة', amount: '35,400 ج.م', color: Color(0xFFB87733)),
                  SizedBox(height: 8),
                  AdminFinancialRow(title: 'عمولة تشغيل المنصة (15%)', amount: '6,780 ج.م', color: Color(0xFFA97835)),
                  SizedBox(height: 8),
                  AdminFinancialRow(title: 'تكلفة شركات الشحن والتوصيل', amount: '3,020 ج.م', color: Color(0xFF2E7D32)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminFinancialRow extends StatelessWidget {
  const AdminFinancialRow({super.key, required this.title, required this.amount, required this.color});
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
