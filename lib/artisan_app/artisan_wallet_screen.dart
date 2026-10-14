import 'package:flutter/material.dart';

class ArtisanWalletScreen extends StatelessWidget {
  const ArtisanWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F), // Dark Slate
      appBar: AppBar(
        title: const Text(
          'محفظة الحرفي والماليات',
          style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 16),
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
            // 💰 بطاقة الرصيد الصافي المتاح للسحب
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
                  const Text(
                    'الرصيد القابل للسحب (مستحقاتك)',
                    style: TextStyle(color: Color(0xFF12181F), fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '11,400 ج.م',
                    style: TextStyle(
                      color: Color(0xFFF5F5F5),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF12181F),
                      foregroundColor: const Color(0xFFFEC7C2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      minimumSize: const Size(double.infinity, 42),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم إرسال طلب السحب إلى محفظتك الكاش بنجاح.')),
                      );
                    },
                    child: const Text('سحب الأرباح (محفظة كاش)', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 📊 تفصيل الحسابات والعمولات المالية
            const Text(
              'تفصيل الإيرادات والمستحقات المالية',
              style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFA97835).withOpacity(0.3)),
              ),
              child: Column(
                children: const [
                  FinancialDetailRow(title: 'إجمالي مبيعات الطلبات', amount: '14,000 ج.م', color: Color(0xFFF5F5F5)),
                  Divider(color: Color(0xFF9E9E9E), height: 20, thickness: 0.5),
                  FinancialDetailRow(title: 'صافي مستحقات الحرفي', amount: '11,400 ج.م', color: Color(0xFFB87733)),
                  SizedBox(height: 8),
                  FinancialDetailRow(title: 'عمولة تشغيل التطبيق (Giza Hub)', amount: '2,100 ج.م', color: Color(0xFFA97835)),
                  SizedBox(height: 8),
                  FinancialDetailRow(title: 'مبالغ التوصيل والشحن (لمندوب الشحن)', amount: '500 ج.م', color: Color(0xFF2E7D32)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinancialDetailRow extends StatelessWidget {
  const FinancialDetailRow({
    super.key,
    required this.title,
    required this.amount,
    required this.color,
  });

  final String title;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.between,
      children: [
        Expanded(child: Text(title, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 11))),
        Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }
}
