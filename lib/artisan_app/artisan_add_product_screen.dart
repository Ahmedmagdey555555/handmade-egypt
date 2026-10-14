import 'package:flutter/material.dart';

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
  
  String _selectedCategory = 'جلد طبيعي';
  final List<String> _categories = ['جلد طبيعي', 'خشب وزان ومطعّم', 'نحاس وفضة', 'فخار وسيراميك تراثي'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12181F), // Dark Slate
      appBar: AppBar(
        title: const Text(
          'إضافة منتج تراثي جديد',
          style: TextStyle(color: Color(0xFFFEC7C2), fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: const Color(0xFF12181F),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFB87733)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ترويسة توضيحية لضمان Handmade Egypt
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2630),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFA97835).withOpacity(0.3)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.verified_user, color: Color(0xFFB87733), size: 24),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'سيتم اعتماد ضمان الـ 3 أشهر (ضمان Handmade Egypt) فور إضافة المنتج ونشره.',
                        style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // حقل اسم المنتج
              const Text('اسم القطعة الفنية', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleController,
                style: const TextStyle(color: Color(0xFFF5F5F5)),
                decoration: InputDecoration(
                  hintText: 'مثال: شنطة جلد طبيعي مطرزة يدوياً',
                  hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
                  filled: true,
                  fillColor: const Color(0xFF1E2630),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                ),
                validator: (value) => value!.isEmpty ? 'يرجى إدخال اسم المنتج' : null,
              ),
              const SizedBox(height: 16),

              // اختيار الفئة
              const Text('تصنيف الحرفة', style: TextStyle(color: Color(0xFFFEC7C2), fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E26
