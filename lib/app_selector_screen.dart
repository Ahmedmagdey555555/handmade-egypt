import 'package:flutter/material.dart';
import 'main.dart'; // تطبيق العملاء
import 'artisan_app/artisan_app_main.dart'; // تطبيق الحرفيين
import 'admin_dashboard/admin_dashboard_screen.dart'; // لوحة تحكم الإدارة

class AppSelectorScreen extends StatelessWidget {
  const AppSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text(
          'Handmade Egypt - Ecosystem Selector',
          style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 16),
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
            const Icon(Icons.hub, color: Color(0xFFB87733), size: 64),
            const SizedBox(height: 16),
            const Text(
              'اختر الواجهة المراد تشغيلها',
              style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'منظومة هاند ميد إيجيبت المتكاملة',
              style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
            ),
            const SizedBox(height: 40),

            // زر تطبيق العملاء
            AppRoleCard(
              title: 'تطبيق العملاء (Consumer App)',
              description: 'تصفح المنتجات، تفاصيل الصنعة، الطلبات الخاصة، والتتبع',
              icon: Icons.shopping_bag_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HandmadeEgyptApp()),
                );
              },
            ),
            const SizedBox(height: 16),

            // زر تطبيق الحرفيين
            AppRoleCard(
              title: 'تطبيق الحرفيين (Artisan App)',
              description: 'لوحة الورشة، إضافة منتجات بضمان هاند ميد، والمحفظة المالية',
              icon: Icons.handyman_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArtisanApp()),
                );
              },
            ),
            const SizedBox(height: 16),

            // زر لوحة تحكم الإدارة
            AppRoleCard(
              title: 'لوحة تحكم الإدارة (Admin Dashboard)',
              description: 'مراجعة واعتماد المنتجات، إدارة الطلبات، والماليات والعمولات',
              icon: Icons.admin_panel_settings_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminDashboardApp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppRoleCard extends StatelessWidget {
  const AppRoleCard({
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

  @default
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
