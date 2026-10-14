import 'package:flutter/material.dart';

class ArtisanOrderDetailsScreen extends StatefulWidget {
  const ArtisanOrderDetailsScreen({super.key});

  @override
  State<ArtisanOrderDetailsScreen> createState() => _ArtisanOrderDetailsScreenState();
}

class _ArtisanOrderDetailsScreenState extends State<ArtisanOrderDetailsScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F),
      appBar: AppBar(
        title: const Text('تفاصيل الطلب الخاص #HE-509', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 15)),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة أو معاينة فكرة العميل الواردة من الإدارة
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFA97835).withOpacity(0.3)),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, color: Color(0xFFB87733), size: 48),
                    SizedBox(height: 8),
                    Text('تصميم العميل المحول من إدارة المنصة', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // تفاصيل الطلب
            const Text('وصف العمل المطلوب:', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2630),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'أريد صندوق خشب زان بنفس تصميم صندوق النرد التراثي، ولكن بمقاس أكبر (40×30 سم) مع حفر اسم العائلة على الغطاء بالنحاس الأصفر.',
                style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 12, height: 1.4),
              ),
            ),
            const SizedBox(height: 24),

            // خانات تحديد السعر ومدة التنفيذ للإدارة
            const Text('تحديد تكلفة التنفيذ ورفعها للإدارة للمراجعة', style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 12),
            
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('مستحقات التاجر (ج.م)', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Color(0xFFF5F5F5)),
                        decoration: InputDecoration(
                          hintText: 'مثال: 3200',
                          hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 11),
                          filled: true,
                          fillColor: const Color(0xFF1E2630),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('مدة التنفيذ (بالأيام)', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _daysController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Color(0xFFF5F5F5)),
                        decoration: InputDecoration(
                          hintText: 'مثال: 7 أيام',
                          hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 11),
                          filled: true,
                          fillColor: const Color(0xFF1E2630),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // زر الإرسال للإدارة
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
                    const SnackBar(content: Text('تم إرسال عرض السعر إلى إدارة المنصة للمراجعة واعتماده للعميل.')),
                  );
                  Navigator.pop(context);
                },
                child: const Text('إرسال عرض السعر للإدارة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
