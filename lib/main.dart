import 'package:flutter/material.dart';
import 'package:handmade_egypt/services/local_storage.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
runApp(const HandmadeEgyptApp());
}

const Color forestGreen = Color(0xFF173D30);
const Color gold = Color(0xFFC6A45C);
const Color cream = Color(0xFFFAF6EE);
const Color charcoal = Color(0xFF292929);

class Product {
final String id;
final String nameAr;
final String nameEn;
final String categoryAr;
final String categoryEn;
final int price;
final IconData icon;
final String descriptionAr;
final String descriptionEn;

const Product({
required this.id,
required this.nameAr,
required this.nameEn,
required this.categoryAr,
required this.categoryEn,
required this.price,
required this.icon,
required this.descriptionAr,
required this.descriptionEn,
});
}

const List<Product> products = [
Product(
id: 'p1',
nameAr: 'شنطة كروشيه يدوية',
nameEn: 'Handmade Crochet Bag',
categoryAr: 'كروشيه',
categoryEn: 'Crochet',
price: 450,
icon: Icons.shopping_bag_outlined,
descriptionAr: 'شنطة مصنوعة يدويًا بعناية وخامات مميزة.',
descriptionEn: 'Carefully handmade bag with quality materials.',
),
Product(
id: 'p2',
nameAr: 'لوحة تطريز فني',
nameEn: 'Embroidery Art',
categoryAr: 'تطريز',
categoryEn: 'Embroidery',
price: 300,
icon: Icons.brush_outlined,
descriptionAr: 'قطعة تطريز يدوية تضيف لمسة فنية لمنزلك.',
descriptionEn: 'Hand-embroidered art for your home.',
),
Product(
id: 'p3',
nameAr: 'هدية يدوية مميزة',
nameEn: 'Handmade Gift',
categoryAr: 'هدايا',
categoryEn: 'Gifts',
price: 250,
icon: Icons.card_giftcard,
descriptionAr: 'هدية مصنوعة بحب ومناسبة للمناسبات المختلفة.',
descriptionEn: 'A thoughtful handmade gift for special occasions.',
),
Product(
id: 'p4',
nameAr: 'قطعة ديكور أنيقة',
nameEn: 'Elegant Home Decor',
categoryAr: 'ديكور',
categoryEn: 'Decor',
price: 380,
icon: Icons.chair_outlined,
descriptionAr: 'ديكور يدوي بتصميم بسيط وأنيق.',
descriptionEn: 'Elegant handmade decoration for your home.',
),
Product(
id: 'p5',
nameAr: 'إكسسوارات يدوية',
nameEn: 'Handmade Accessories',
categoryAr: 'إكسسوارات',
categoryEn: 'Accessories',
price: 180,
icon: Icons.diamond_outlined,
descriptionAr: 'إكسسوارات بتفاصيل دقيقة وتصميم مميز.',
descriptionEn: 'Unique accessories with detailed craftsmanship.',
),
Product(
id: 'p6',
nameAr: 'قطعة حياكة صوفية',
nameEn: 'Knitted Wool Piece',
categoryAr: 'حياكة',
categoryEn: 'Knitting',
price: 520,
icon: Icons.checkroom_outlined,
descriptionAr: 'قطعة محاكة يدويًا بخامات ناعمة.',
descriptionEn: 'Soft, carefully knitted handmade piece.',
),
Product(
id: 'p7',
nameAr: 'هدية محفورة بالاسم',
nameEn: 'Personalized Engraved Gift',
categoryAr: 'حفر بالليزر',
categoryEn: 'Laser Engraving',
price: 220,
icon: Icons.draw_outlined,
descriptionAr: 'هدية قابلة للتخصيص بالاسم أو العبارة المطلوبة.',
descriptionEn: 'A personalized gift with your chosen name or message.',
),
Product(
id: 'p8',
nameAr: 'قطعة أثاث يدوي',
nameEn: 'Handcrafted Furniture',
categoryAr: 'مفروشات',
categoryEn: 'Furnishings',
price: 750,
icon: Icons.weekend_outlined,
descriptionAr: 'قطعة مصنوعة يدويًا بلمسات مصرية.',
descriptionEn: 'Handcrafted furniture with Egyptian character.',
),
];

class HandmadeEgyptApp extends StatefulWidget {
const HandmadeEgyptApp({super.key});

@override
State<HandmadeEgyptApp> createState() => _HandmadeEgyptAppState();
}

class _HandmadeEgyptAppState extends State<HandmadeEgyptApp> {
bool isArabic = true;

@override
void initState() {
super.initState();
_loadLanguage();
}

Future<void> loadLanguage() async {
try {
final language = await LocalStorage.getLanguage();
if (!mounted) return;
setState(() => isArabic = language != 'en');
} catch () {
// استمرار التطبيق بالعربية إذا تعذر تحميل الإعداد.
}
}

Future<void> _toggleLanguage() async {
setState(() => isArabic = !isArabic);

try {
  await LocalStorage.saveLanguage(isArabic ? 'ar' : 'en');
} catch (_) {
  // تغيير اللغة يظل فعالًا خلال الجلسة الحالية.
}

}

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Handmade Egypt',
theme: ThemeData(
useMaterial3: true,
scaffoldBackgroundColor: cream,
colorScheme: ColorScheme.fromSeed(
seedColor: forestGreen,
primary: forestGreen,
secondary: gold,
surface: Colors.white,
),
appBarTheme: const AppBarTheme(
backgroundColor: forestGreen,
foregroundColor: Colors.white,
centerTitle: true,
),
elevatedButtonTheme: ElevatedButtonThemeData(
style: ElevatedButton.styleFrom(
backgroundColor: forestGreen,
foregroundColor: Colors.white,
padding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 13,
),
),
),
inputDecorationTheme: InputDecorationTheme(
filled: true,
fillColor: Colors.white,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),
borderSide: BorderSide.none,
),
),
),
home: Directionality(
textDirection:
isArabic ? TextDirection.rtl : TextDirection.ltr,
child: MainNavigation(
isArabic: isArabic,
onLanguageChanged: _toggleLanguage,
),
),
);
}
}

class MainNavigation extends StatefulWidget {
final bool isArabic;
final VoidCallback onLanguageChanged;

const MainNavigation({
super.key,
required this.isArabic,
required this.onLanguageChanged,
});

@override
State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
int selectedIndex = 0;
final List<Product> cart = [];

String t(String ar, String en) => widget.isArabic ? ar : en;

void addToCart(Product product) {
setState(() => cart.add(product));
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(t('تمت إضافة المنتج إلى السلة', 'Added to cart')),
backgroundColor: forestGreen,
duration: const Duration(seconds: 2),
),
);
}

void removeFromCart(int index) {
setState(() => cart.removeAt(index));
}

void openCustomOrder() {
Navigator.of(context).push(
MaterialPageRoute<void>(
builder: (_) => Directionality(
textDirection:
widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
child: CustomOrderScreen(isArabic: widget.isArabic),
),
),
);
}

@override
Widget build(BuildContext context) {
final pages = [
HomeScreen(
isArabic: widget.isArabic,
onLanguageChanged: widget.onLanguageChanged,
onAddToCart: addToCart,
onOpenCart: () => setState(() => selectedIndex = 1),
onCustomOrder: openCustomOrder,
),
CartScreen(
isArabic: widget.isArabic,
cart: cart,
onRemove: removeFromCart,
),
AccountScreen(
isArabic: widget.isArabic,
onLanguageChanged: widget.onLanguageChanged,
),
];

return Scaffold(
  body: IndexedStack(
    index: selectedIndex,
    children: pages,
  ),
  bottomNavigationBar: NavigationBar(
    selectedIndex: selectedIndex,
    backgroundColor: Colors.white,
    indicatorColor: gold.withValues(alpha: 0.25),
    onDestinationSelected: (index) {
      setState(() => selectedIndex = index);
    },
    destinations: [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: t('الرئيسية', 'Home'),
      ),
      NavigationDestination(
        icon: Badge(
          isLabelVisible: cart.isNotEmpty,
          label: Text('${cart.length}'),
          child: const Icon(Icons.shopping_cart_outlined),
        ),
        selectedIcon: const Icon(Icons.shopping_cart),
        label: t('السلة', 'Cart'),
      ),
      NavigationDestination(
        icon: const Icon(Icons.person_outline),
        selectedIcon: const Icon(Icons.person),
        label: t('حسابي', 'Account'),
      ),
    ],
  ),
);

}
}

class HomeScreen extends StatefulWidget {
final bool isArabic;
final VoidCallback onLanguageChanged;
final ValueChanged<Product> onAddToCart;
final VoidCallback onOpenCart;
final VoidCallback onCustomOrder;

const HomeScreen({
super.key,
required this.isArabic,
required this.onLanguageChanged,
required this.onAddToCart,
required this.onOpenCart,
required this.onCustomOrder,
});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final TextEditingController searchController = TextEditingController();
String selectedCategory = 'all';

String t(String ar, String en) => widget.isArabic ? ar : en;

final List<Map<String, dynamic>> categories = [
{'id': 'all', 'ar': 'الكل', 'en': 'All', 'icon': Icons.apps},
{
'id': 'crochet',
'ar': 'كروشيه',
'en': 'Crochet',
'icon': Icons.shopping_bag_outlined
},
{
'id': 'embroidery',
'ar': 'تطريز',
'en': 'Embroidery',
'icon': Icons.brush_outlined
},
{
'id': 'gifts',
'ar': 'هدايا',
'en': 'Gifts',
'icon': Icons.card_giftcard
},
{
'id': 'decor',
'ar': 'ديكور',
'en': 'Decor',
'icon': Icons.chair_outlined
},
{
'id': 'accessories',
'ar': 'إكسسوارات',
'en': 'Accessories',
'icon': Icons.diamond_outlined
},
];

String categoryId(Product product) {
switch (product.categoryAr) {
case 'كروشيه':
return 'crochet';
case 'تطريز':
return 'embroidery';
case 'هدايا':
return 'gifts';
case 'ديكور':
return 'decor';
case 'إكسسوارات':
return 'accessories';
default:
return 'other';
}
}

@override
void dispose() {
searchController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
final query = searchController.text.trim().toLowerCase();

final filteredProducts = products.where((product) {
  final matchesCategory = selectedCategory == 'all' ||
      categoryId(product) == selectedCategory;

  final matchesSearch = query.isEmpty ||
      product.nameAr.toLowerCase().contains(query) ||
      product.nameEn.toLowerCase().contains(query) ||
      product.categoryAr.toLowerCase().contains(query) ||
      product.categoryEn.toLowerCase().contains(query);

  return matchesCategory && matchesSearch;
}).toList();

return Scaffold(
  appBar: AppBar(
    title: const Text(
      'هاند ميد مصر',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(
        tooltip: t('تغيير اللغة', 'Change language'),
        onPressed: widget.onLanguageChanged,
        icon: const Icon(Icons.language),
      ),
      IconButton(
        tooltip: t('سلة المشتريات', 'Shopping cart'),
        onPressed: widget.onOpenCart,
        icon: const Icon(Icons.shopping_cart_outlined),
      ),
    ],
  ),
  body: SafeArea(
    child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: forestGreen,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t(
                  'صناعة مصرية.. بإبداع يدوي',
                  'Egyptian Craftsmanship, Made by Hand',
                ),
                style: const TextStyle(
                  color: gold,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                t(
                  'اكتشف منتجات مميزة صنعها حرفيون مصريون، أو اطلب تصميمك الخاص.',
                  'Discover Egyptian handmade products or request your own design.',
                ),
                style: const TextStyle(
                  color: Colors.white,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton.icon(
                onPressed: widget.onCustomOrder,
                icon: const Icon(Icons.design_services_outlined),
                label: Text(t('نفّذ تصميمك', 'Create Your Design')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: gold,
                  foregroundColor: charcoal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        TextField(
          controller: searchController,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: t('ابحث عن منتج أو حرفة...', 'Search products...'),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: searchController.text.isEmpty
                ? null
                : IconButton(
                    onPressed: () {
                      searchController.clear();
                      setState(() {});
                    },
                    icon: const Icon(Icons.close),
                  ),
          ),
        ),
        const SizedBox(height: 22),
        _sectionTitle(t('تسوّق حسب القسم', 'Shop by Category')),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedCategory == category['id'];

              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  setState(() {
                    selectedCategory = category['id'] as String;
                  });
                },
                child: Container(
                  width: 90,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected ? forestGreen : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? gold : Colors.black12,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category['icon'] as IconData,
                        color: isSelected ? gold : forestGreen,
                        size: 28,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        t(
                          category['ar'] as String,
                          category['en'] as String,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              isSelected ? Colors.white : charcoal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        _sectionTitle(t('منتجات مميزة', 'Featured Products')),
        const SizedBox(height: 12),
        if (filteredProducts.isEmpty)
          Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Text(
                t('لا توجد منتجات مطابقة للبحث', 'No matching products'),
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredProducts.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.67,
            ),
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return ProductCard(
                product: product,
                isArabic: widget.isArabic,
                onAdd: () => widget.onAddToCart(product),
              );
            },
          ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: gold.withValues(alpha: 0.6)),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.handshake_outlined,
                size: 38,
                color: forestGreen,
              ),
              const SizedBox(height: 10),
              Text(
                t('هل تصنع منتجات يدوية؟', 'Are you a handmade seller?'),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                t(
                  'انضم إلى مجتمع الحرفيين المصريين.',
                  'Join our community of Egyptian artisans.',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => Directionality(
                        textDirection: widget.isArabic
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: SellerApplicationScreen(
                          isArabic: widget.isArabic,
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  t('قدّم طلب الانضمام', 'Apply to Become a Seller'),
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

Widget _sectionTitle(String title) {
return Text(
title,
style: const TextStyle(
color: forestGreen,
fontSize: 19,
fontWeight: FontWeight.bold,
),
);
}
}

class ProductCard extends StatelessWidget {
final Product product;
final bool isArabic;
final VoidCallback onAdd;

const ProductCard({
super.key,
required this.product,
required this.isArabic,
required this.onAdd,
});

@override
Widget build(BuildContext context) {
final name = isArabic ? product.nameAr : product.nameEn;
final category = isArabic ? product.categoryAr : product.categoryEn;

return Card(
  elevation: 1,
  color: Colors.white,
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: Container(
          color: cream,
          child: Icon(
            product.icon,
            size: 62,
            color: forestGreen,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
        child: Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          category,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 6, 10, 0),
        child: Text(
          '${product.price} ${isArabic ? 'ج.م' : 'EGP'}',
          style: const TextStyle(
            color: forestGreen,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: 38,
          child: ElevatedButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add_shopping_cart, size: 17),
            label: Text(
              isArabic ? 'أضف للسلة' : 'Add to cart',
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    ],
  ),
);

}
}

class CartScreen extends StatelessWidget {
final bool isArabic;
final List<Product> cart;
final ValueChanged<int> onRemove;

const CartScreen({
super.key,
required this.isArabic,
required this.cart,
required this.onRemove,
});

@override
Widget build(BuildContext context) {
final total = cart.fold<int>(0, (sum, item) => sum + item.price);

return Scaffold(
  appBar: AppBar(
    title: Text(isArabic ? 'سلة المشتريات' : 'Shopping Cart'),
  ),
  body: cart.isEmpty
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                size: 75,
                color: gold,
              ),
              const SizedBox(height: 14),
              Text(
                isArabic ? 'السلة فارغة حاليًا' : 'Your cart is empty',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        )
      : Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: cart.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final product = cart[index];

                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: cream,
                        child: Icon(product.icon, color: forestGreen),
                      ),
                      title: Text(
                        isArabic ? product.nameAr : product.nameEn,
                      ),
                      subtitle: Text(
                        '${product.price} ${isArabic ? 'ج.م' : 'EGP'}',
                      ),
                      trailing: IconButton(
                        tooltip: isArabic ? 'حذف' : 'Remove',
                        onPressed: () => onRemove(index),
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: SafeArea(
                top: false,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isArabic ? 'الإجمالي' : 'Total',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$total ${isArabic ? 'ج.م' : 'EGP'}',
                          style: const TextStyle(
                            color: forestGreen,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isArabic
                                    ? 'إتمام الشراء غير متاح حتى ربط الدفع الإلكتروني.'
                                    : 'Checkout will be available after online payment integration.',
                              ),
                            ),
                          );
                        },
                        child: Text(
                          isArabic ? 'متابعة الشراء' : 'Continue to checkout',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
);

}
}

class CustomOrderScreen extends StatefulWidget {
final bool isArabic;

const CustomOrderScreen({super.key, required this.isArabic});

@override
State<CustomOrderScreen> createState() => _CustomOrderScreenState();
}

class _CustomOrderScreenState extends State<CustomOrderScreen> {
final formKey = GlobalKey<FormState>();
final descriptionController = TextEditingController();
final materialController = TextEditingController();
final colorController = TextEditingController();
final sizeController = TextEditingController();
final quantityController = TextEditingController(text: '1');
final budgetController = TextEditingController();
final governorateController = TextEditingController();

String t(String ar, String en) => widget.isArabic ? ar : en;

@override
void dispose() {
descriptionController.dispose();
materialController.dispose();
colorController.dispose();
sizeController.dispose();
quantityController.dispose();
budgetController.dispose();
governorateController.dispose();
super.dispose();
}

void submitRequest() {
if (!formKey.currentState!.validate()) return;

showDialog<void>(
  context: context,
  builder: (dialogContext) => AlertDialog(
    title: Text(t('تم تجهيز طلبك', 'Request prepared')),
    content: Text(
      t(
        'تم التحقق من البيانات في هذه النسخة التجريبية. لم يُرسل الطلب إلى بائعين بعد لأن قاعدة البيانات غير مربوطة.',
        'Your details were validated in this prototype. The request has not been sent to sellers because the database is not connected yet.',
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(dialogContext).pop();
          Navigator.of(context).pop();
        },
        child: Text(t('حسنًا', 'OK')),
      ),
    ],
  ),
);

}

Widget input(
String label,
TextEditingController controller, {
int maxLines = 1,
TextInputType keyboardType = TextInputType.text,
bool requiredField = false,
}) {
return Padding(
padding: const EdgeInsets.only(bottom: 14),
child: TextFormField(
controller: controller,
maxLines: maxLines,
keyboardType: keyboardType,
decoration: InputDecoration(labelText: label),
validator: requiredField
? (value) {
if (value == null || value.trim().isEmpty) {
return t('الحقل ده مطلوب', 'This field is required');
}
return null;
}
: null,
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(t('نفّذ تصميمك', 'Create Your Design')),
),
body: Form(
key: formKey,
child: ListView(
padding: const EdgeInsets.all(18),
children: [
Text(
t(
'احكيلنا عن التصميم اللي في خيالك',
'Tell us about your design',
),
style: const TextStyle(
fontSize: 21,
color: forestGreen,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8),
Text(
t(
'املأ التفاصيل المطلوبة علشان تكون جاهزة عند ربط خدمة الطلبات.',
'Fill in the details so they are ready when order services are connected.',
),
),
const SizedBox(height: 20),
input(
t('وصف التصميم', 'Design description'),
descriptionController,
maxLines: 4,
requiredField: true,
),
input(t('الخامات المطلوبة', 'Preferred materials'), materialController),
input(t('اللون', 'Color'), colorController),
input(t('المقاس', 'Size'), sizeController),
input(
t('الكمية', 'Quantity'),
quantityController,
keyboardType: TextInputType.number,
requiredField: true,
),
input(
t('الميزانية بالجنيه المصري', 'Budget in EGP'),
budgetController,
keyboardType: const TextInputType.numberWithOptions(decimal: true),
),
input(
t('المحافظة', 'Governorate'),
governorateController,
requiredField: true,
),
const SizedBox(height: 8),
ElevatedButton.icon(
onPressed: submitRequest,
icon: const Icon(Icons.send_outlined),
label: Text(t('تجهيز الطلب', 'Prepare request')),
),
],
),
),
);
}
}

class AccountScreen extends StatelessWidget {
final bool isArabic;
final VoidCallback onLanguageChanged;

const AccountScreen({
super.key,
required this.isArabic,
required this.onLanguageChanged,
});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(isArabic ? 'حسابي' : 'My Account'),
),
body: ListView(
padding: const EdgeInsets.all(18),
children: [
const SizedBox(height: 12),
const CircleAvatar(
radius: 42,
backgroundColor: forestGreen,
child: Icon(Icons.person_outline, size: 48, color: gold),
),
const SizedBox(height: 14),
Text(
isArabic ? 'مرحبًا بك في هاند ميد مصر' : 'Welcome to Handmade Egypt',
textAlign: TextAlign.center,
style: const TextStyle(
fontSize: 19,
fontWeight: FontWeight.bold,
color: forestGreen,
),
),
const SizedBox(height: 24),
Card(
color: Colors.white,
child: ListTile(
leading: const Icon(Icons.language, color: forestGreen),
title: Text(isArabic ? 'لغة التطبيق' : 'App language'),
subtitle: Text(isArabic ? 'العربية' : 'English'),
trailing: const Icon(Icons.swap_horiz),
onTap: onLanguageChanged,
),
),
Card(
color: Colors.white,
child: ListTile(
leading: const Icon(Icons.storefront_outlined, color: forestGreen),
title: Text(
isArabic ? 'الانضمام كبائع' : 'Become a seller',
),
subtitle: Text(
isArabic
? 'قدّم طلبًا لعرض منتجاتك'
: 'Apply to list your products',
),
onTap: () {
Navigator.of(context).push(
MaterialPageRoute<void>(
builder: (_) => Directionality(
textDirection:
isArabic ? TextDirection.rtl : TextDirection.ltr,
child: SellerApplicationScreen(isArabic: isArabic),
),
),
);
},
),
),
Card(
color: Colors.white,
child: ListTile(
leading: const Icon(Icons.info_outline, color: forestGreen),
title: Text(isArabic ? 'عن التطبيق' : 'About the app'),
subtitle: Text(
isArabic
? 'منصة مصرية للمنتجات المصنوعة يدويًا'
: 'An Egyptian marketplace for handmade products',
),
),
),
],
),
);
}
}

class SellerApplicationScreen extends StatefulWidget {
final bool isArabic;

const SellerApplicationScreen({super.key, required this.isArabic});

@override
State<SellerApplicationScreen> createState() =>
_SellerApplicationScreenState();
}

class _SellerApplicationScreenState extends State<SellerApplicationScreen> {
final formKey = GlobalKey<FormState>();
final ownerController = TextEditingController();
final storeController = TextEditingController();
final phoneController = TextEditingController();
final governorateController = TextEditingController();
final categoryController = TextEditingController();

String t(String ar, String en) => widget.isArabic ? ar : en;

@override
void dispose() {
ownerController.dispose();
storeController.dispose();
phoneController.dispose();
governorateController.dispose();
categoryController.dispose();
super.dispose();
}

Widget field(String label, TextEditingController controller) {
return Padding(
padding: const EdgeInsets.only(bottom: 14),
child: TextFormField(
controller: controller,
decoration: InputDecoration(labelText: label),
validator: (value) {
if (value == null || value.trim().isEmpty) {
return t('الحقل ده مطلوب', 'This field is required');
}
return null;
},
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(t('طلب الانضمام كبائع', 'Seller Application')),
),
body: Form(
key: formKey,
child: ListView(
padding: const EdgeInsets.all(18),
children: [
Text(
t(
'انضم إلى مجتمع الحرفيين المصريين',
'Join Egyptian Artisans',
),
style: const TextStyle(
fontSize: 21,
fontWeight: FontWeight.bold,
color: forestGreen,
),
),
const SizedBox(height: 20),
field(t('اسم صاحب المتجر', 'Owner name'), ownerController),
field(t('اسم المتجر', 'Store name'), storeController),
field(t('رقم الهاتف', 'Phone number'), phoneController),
field(t('المحافظة', 'Governorate'), governorateController),
field(t('نوع المنتجات', 'Product category'), categoryController),
const SizedBox(height: 8),
ElevatedButton(
onPressed: () {
if (!formKey.currentState!.validate()) return;

            showDialog<void>(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: Text(t('الطلب جاهز للمراجعة', 'Application prepared')),
                content: Text(
                  t(
                    'هذه نسخة تجريبية. لم يتم إرسال الطلب للإدارة بعد.',
                    'This is a prototype. The application has not been sent to the admin yet.',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text(t('حسنًا', 'OK')),
                  ),
                ],
              ),
            );
          },
          child: Text(t('إرسال طلب الانضمام', 'Submit application')),
        ),
      ],
    ),
  ),
);

}
}
