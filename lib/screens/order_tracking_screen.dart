import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F), // Dark Slate
      appBar: AppBar(
        title: const Text(
          'تتبع الطلب الشحنة',
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
            // معلومات الطلب الأساسية
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFA97835).withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'طلب رقم #HE-9824',
                    style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'شنطة جلد طبيعي مطرزة يدوياً',
                    style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Color(0xFF9E9E9E), thickness: 0.5),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('الحالة الحالية:', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
                      Text('جاري فحص الجودة في Giza Hub', style: TextStyle(color: Color(0xFFB87733), fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // عنوان خط الزمن
            const Text(
              'خط الزمن لتتبع الشحنة (Live Tracking)',
              style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // خطوات خط الزمن (Timeline)
            const TrackingStepItem(
              title: 'تم تأكيد الطلب بنجاح',
              subtitle: 'تم استلام طلبك وبدء تجهيز الخامات مع الحرفي.',
              time: 'أمس، 02:30 م',
              isCompleted: true,
              isCurrent: false,
            ),
            const TrackingStepItem(
              title: 'فحص الجودة والتغليف في Handmade Hub',
              subtitle: 'القطعة تخضع لاختبارات الجودة الصارمة وشهادة الأصالة.',
              time: 'اليوم، 10:00 ص',
              isCompleted: true,
              isCurrent: true, // الخطوة الحالية
            ),
            const TrackingStepItem(
              title: 'خرج مع مندوب الشحن',
              subtitle: 'في طريقه إلى عنوانك المحدد في القاهرة.',
              time: 'قريباً',
              isCompleted: false,
              isCurrent: false,
            ),
            const TrackingStepItem(
              title: 'تم التوصيل بنجاح',
              subtitle: 'استمتع بقطعتك الفنية الفريدة!',
              time: 'منتظر',
              isCompleted: false,
              isCurrent: false,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}

// ويدجت عنصر خط الزمن
class TrackingStepItem extends StatelessWidget {
  const TrackingStepItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isCompleted,
    required this.isCurrent,
    this.isLast = false,
  });

  final String title;
  final String subtitle;
  final String time;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // عمود المؤشر والخط الواصل
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted || isCurrent ? const Color(0xFFB87733) : const Color(0xFF1E2630),
                border: Border.all(
                  color: isCurrent ? const Color(0xFFFEC7C2) : const Color(0xFFA97835),
                  width: 2,
                ),
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, size: 14, color: Color(0xFF12181F))
                    : (isCurrent ? const Icon(Icons.fiber_manual_record, size: 10, color: Color(0xFFFEC7C2)) : null),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: isCompleted ? const Color(0xFFB87733) : const Color(0xFF1E2630),
              ),
          ],
        ),
        const SizedBox(width: 16),
        // محتوى الخطوة
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isCurrent || isCompleted ? const Color(0xFFFEC7C2) : const Color(0xFF9E9E9E),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFFF5F5F5), fontSize: 12),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
