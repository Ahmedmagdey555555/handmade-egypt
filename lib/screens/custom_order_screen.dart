import 'package:flutter/material.dart';

class CustomOrderScreen extends StatelessWidget {
  const CustomOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F), // Dark Slate
      appBar: AppBar(
        title: const Text(
          'الطلبات الخاصة والتصاميم المخصصة',
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
            // ترويحة توضيحية للخدمة
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
                    'صمم قطعتك الفريدة بنفسك',
                    style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'ارفع صورة الفكرة أو صف طلبك، وسيقوم حرفيو Giza Hub بدراسته، تقديم عرض سعر، والتنفيذ بمعايير الجودة المطلقة.',
                    style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 12, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // نموذج إرسال طلب جديد
            const Text(
              'تفاصيل الطلب الجديد',
              style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // حقل وصف الفكرة
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFA97835).withOpacity(0.2)),
              ),
              child: const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'اكتب تفاصيل الفكرة، الأبعاد، أو الخامات المطلوبة (جلد، فخار، تطريز)...',
                  hintStyle: TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // زر إرفاق صورة مرجعية
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFB87733),
                side: const BorderSide(color: Color(0xFFB87733)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 45),
              ),
              onPressed: () {},
              icon: const Icon(Icons.image_outlined),
              label: const Text('إرفاق صورة مرجعية للتصميم'),
            ),
            const SizedBox(height: 20),

            // زر إرسال الطلب
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
                    const SnackBar(content: Text('تم إرسال طلبك الخاص بنجاح إلى Giza Hub والحرفيين!')),
                  );
                },
                child: const Text('إرسال طلب التصميم للحرفي', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 32),

            // قسم الطلبات الخاصة السابقة وقيد التنفيذ (مع مؤشر تقدم ودردشة مباشرة)
            const Text(
              'طلباتك الخاصة الحالية',
              style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'صندوق نرد خشبي مطعم بالنحاس',
                        style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        'قيد التنفيذ (60%)',
                        style: TextStyle(color: Color(0xFFB87733), fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // مؤشر التقدم (Progress Bar)
                  const LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: Color(0xFF12181F),
                    color: Color(0xFFB87733),
                    minHeight: 6,
                  ),
                  const SizedBox(height: 12),
                  // زر الانتقال للدردشة المباشرة مع الحرفي
                  SizedBox(
                    width: double.infinity,
                    height: 38,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFFEC7C2),
                        side: BorderSide(color: const Color(0xFFA97835).withOpacity(0.5)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        // فتح نافذة الدردشة المباشرة لمتابعة تقدم الطلب
                      },
                      icon: const Icon(Icons.chat_bubble_outline, size: 16, color: Color(0xFFB87733)),
                      label: const Text('فتح الدردشة المباشرة مع الحرفي', style: TextStyle(fontSize: 12)),
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
