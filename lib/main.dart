import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HandmadeEgyptEcosystemApp());
}

class HandmadeEgyptEcosystemApp extends StatelessWidget {
  const HandmadeEgyptEcosystemApp({super.key});

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
      home: const EcosystemSelectorScreen(),
    );
  }
}

// =====================================================================
// شاشة اختيار الواجهات المركزية (ربط الأنظمة الثلاثة)
// =====================================================================
class EcosystemSelectorScreen extends StatelessWidget {
  const EcosystemSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text(
          'Handmade Egypt - Ecosystem Hub',
          style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 15),
        ),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.hub, color: Color(0xFFB87733), size: 60),
            const SizedBox(height: 12),
            const Text(
              'اختر النظام المطلوب تشغيله',
              style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'منظومة متكاملة لربط العملاء والحرفيين والإدارة',
              style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11),
            ),
            const SizedBox(height: 35),

            // 1. تطبيق العملاء
            RoleCard(
              title: 'تطبيق العملاء (Consumer App)',
              description: 'تصفح المنتجات التراثية، تفاصيل الصنعة، والطلبات الخاصة',
              icon: Icons.shopping_bag_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConsumerAppPlaceholder()),
                );
              },
            ),
            const SizedBox(height: 14),

            // 2. تطبيق الحرفيين
            RoleCard(
              title: 'تطبيق الحرفيين (Artisan App)',
              description: 'إدارة الورشة، رفع منتجات بضمان هاند ميد، والمحفظة المالية',
              icon: Icons.handyman_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArtisanAppPlaceholder()),
                );
              },
            ),
            const SizedBox(height: 14),

            // 3. لوحة تحكم الإدارة
            RoleCard(
              title: 'لوحة تحكم الإدارة (Admin Dashboard)',
              description: 'مراجعة المنتجات، إدارة الطلبات، الحرفيين، الشحن، والماليات',
              icon: Icons.admin_panel_settings_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminDashboardPlaceholder()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2630),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFA97835).withOpacity(0.4)),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFB87733), size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(description, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 10)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF9E9E9E), size: 14),
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// واجهات مؤقتة لكل تطبيق
// =====================================================================
class ConsumerAppPlaceholder extends StatelessWidget {
  const ConsumerAppPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('تطبيق العملاء', style: TextStyle(color: Color(0xFFFEC7C2))),
        backgroundColor: const Color(0xFF12181F),
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: const Center(
        child: Text('واجهة تصفح المنتجات والطلب الخاص للعملاء تعمل بكفاءة', style: TextStyle(color: Color(0xFFFEC7C2))),
      ),
    );
  }
}

class ArtisanAppPlaceholder extends StatelessWidget {
  const ArtisanAppPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('تطبيق الحرفيين', style: TextStyle(color: Color(0xFFFEC7C2))),
        backgroundColor: const Color(0xFF12181F),
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: const Center(
        child: Text('واجهة إدارة الورشة وإضافة المنتجات والمحفظة للحرفي تعمل بكفاءة', style: TextStyle(color: Color(0xFFFEC7C2))),
      ),
    );
  }
}

class AdminDashboardPlaceholder extends StatelessWidget {
  const AdminDashboardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('لوحة تحكم الإدارة الشاملة', style: TextStyle(color: Color(0xFFFEC7C2))),
        backgroundColor: const Color(0xFF12181F),
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: const Center(
        child: Text('لوحة إدارة المنتجات، الحرفيين، الشحن والماليات تعمل بكفاءة', style: TextStyle(color: Color(0xFFFEC7C2))),
      ),
    );
  }
}
