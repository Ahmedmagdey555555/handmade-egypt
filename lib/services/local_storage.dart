import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static const String _languageKey = 'app_language';
  static const String _cartKey = 'shopping_cart';

  /// حفظ لغة التطبيق
  static Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
  }

  /// استرجاع لغة التطبيق
  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'ar';
  }

  /// حفظ قائمة المنتجات في السلة
  static Future<void> saveCart(List<String> productIds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_cartKey, productIds);
  }

  /// استرجاع قائمة المنتجات من السلة
  static Future<List<String>> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_cartKey) ?? [];
  }

  /// مسح محتويات السلة المحفوظة
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
