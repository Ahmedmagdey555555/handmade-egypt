import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // طريقة الدفع الافتراضية المفعّلة حالياً
  String selectedPaymentMethod = 'wallet'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F), // Dark Slate
      appBar: AppBar(
        title: const Text(
          'تفاصيل القطعة الفنية',
          style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ صورة المنتج الكبيرة مع توثيق Giza Hub
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: const Color(0xFF1E2630),
                  child: const Center(
                    child: Icon(Icons.image, color: Color(0xFF9E9E9E), size: 80),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA97835), // Antique Gold
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Giza Hub Verified',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF12181F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم المنتج والسعر
                  const Text(
                    'شنطة جلد طبيعي مطرزة يدوياً',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFEC7C2), // Cream Ivory
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '2,450 ج.م',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB87733), // Copper
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 🛡️ الضمان تحت صورة المنتج مباشرة كما طلبنا
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2630),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFA97835).withOpacity(0.3)),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.verified_user, color: Color(0xFFB87733), size: 20),
                        SizedBox(width: 10),
                        Text(
                          'ضمان 3 أشهر ضد عيوب الصناعة - Handmade Egypt',
                          style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // وصف المنتج وقصة الحرفي
                  const Text(
                    'وصف القطعة',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFEC7C2)),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'قطعة فنية فريدة مصنوعة بالكامل من أجود أنواع الجلود الطبيعية المصرية، بتطريز تراثي يدوي استغرق تنفيذه أكثر من 40 ساعة عمل بواسطة حرفيين معتمدين.',
                    style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 24),

                  // 💳 قسم اختيار طريقة الدفع (محفظة كاش مفعلة، والباقي قريباً)
                  const Text(
                    'طريقة الدفع',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFEC7C2)),
                  ),
                  const SizedBox(height: 12),

                  // 1. محفظة كاش (مفعلة)
                  PaymentOptionTile(
                    title: 'محافظ المحمول (فودافون كاش، اتصالات، إلخ)',
                    subtitle: 'مفعل - دفع فوري آمن',
                    isActive: true,
                    isSelected: selectedPaymentMethod == 'wallet',
                    onTap: () {
                      setState(() {
                        selectedPaymentMethod = 'wallet';
                      });
                    },
                  ),
                  const SizedBox(height: 8),

                  // 2. إنستا باي (غير مفعل مؤقتاً)
                  PaymentOptionTile(
                    title: 'إنستا باي (InstaPay)',
                    subtitle: 'قريباً...',
                    isActive: false,
                    isSelected: false,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('هذه الطريقة ستتوفر قريباً، يرجى استخدام محفظة كاش حالياً.')),
                      );
                    },
                  ),
                  const SizedBox(height: 8),

                  // 3. البطاقات الائتمانية (غير مفعل مؤقتاً)
                  PaymentOptionTile(
                    title: 'البطاقات الائتمانية (Visa / Mastercard)',
                    subtitle: 'قريباً...',
                    isActive: false,
                    isSelected: false,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('هذه الطريقة ستتوفر قريباً، يرجى استخدام محفظة كاش حالياً.')),
                      );
                    },
                  ),
                  const SizedBox(height: 32),

                  // زر إتمام الطلب الشراء
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB87733),
                        foregroundColor: const Color(0xFF12181F),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        // منطق إتمام الطلب
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم استلام طلبك بنجاح وجاري معالجته عبر Giza Hub!')),
                        );
                      },
                      child: const Text(
                        'إتمام الشراء الآن',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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

// ويدجت خيار الدفع
class PaymentOptionTile extends StatelessWidget {
  const PaymentOptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool isActive;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2630),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFFB87733) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isActive ? Icons.radio_button_checked : Icons.lock_outline,
              color: isActive ? const Color(0xFFB87733) : const Color(0xFF9E9E9E),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isActive ? const Color(0xFFF5F5F5) : const Color(0xFF9E9E9E),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isActive ? const Color(0xFFB87733) : const Color(0xFF9E9E9E),
                      fontSize: 11,
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
