import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F), // Dark Slate
      appBar: AppBar(
        title: const Text(
          'حسابي',
          style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة الملف الشخصي المختصرة
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFA97835).withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFB87733),
                    ),
                    child: const Center(
                      child: Icon(Icons.person, color: Color(0xFF12181F), size: 32),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'أحمد مجدي',
                          style: TextStyle(
                            color: Color(0xFFFEC7C2),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ahmed.magdey@example.com',
                          style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // قائمة الإعدادات والخيارات
            const Text(
              'إعدادات التطبيق والحساب',
              style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            AccountMenuItem(
              icon: Icons.language,
              title: 'لغة التطبيق (Language: AR / EN)',
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.location_on_outlined,
              title: 'عناوين الشحن المحفوظة',
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.verified_user_outlined,
              title: 'معايير جودة Giza Hub والضمان',
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.privacy_tip_outlined,
              title: 'سياسة الخصوصية والشروط والأحكام',
              onTap: () {},
            ),
            const SizedBox(height: 24),

            // ⚠️ زر حذف الحساب والبيانات (إلزامي)
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.withOpacity(0.4)),
              ),
              child: ListTile(
                leading: const Icon(Icons.delete_forever, color: Colors.redAccent),
                title: const Text(
                  'حذف الحساب والبيانات نهائياً',
                  style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: const Text(
                  'إزالة جميع بياناتك الشخصية وسجل الطلبات من النظام',
                  style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 10),
                ),
                onTap: () {
                  // نافذة تأكيد الحذف الإلزامية
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color(0xFF1E2630),
                      title: const Text('تأكيد حذف الحساب', style: TextStyle(color: Color(0xFFFEC7C2))),
                      content: const Text(
                        'هل أنت متأكد من رغبتك في حذف حسابك نهائياً؟ سيتم مسح كافة البيانات وسجل الطلبات ولا يمكن التراجع عن هذا الإجراء.',
                        style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 13),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('إلغاء', style: TextStyle(color: Color(0xFF9E9E9E))),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // منطق حذف الحساب
                          },
                          child: const Text('حذف نهائي', style: TextStyle(color: Colors.redAccent)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ويدجت لعناصر القائمة
class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2630),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFB87733)),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xFFF5F5F5), fontSize: 13),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF9E9E9E), size: 14),
        onTap: onTap,
      ),
    );
  }
}
