class CustomOrder {
final String id;
final String customerId;

// وصف التصميم المطلوب
final String descriptionAr;
final String descriptionEn;

// تفاصيل التنفيذ
final String material;
final String color;
final String size;
final int quantity;

// الميزانية والموقع
final double budget;
final String governorate;
final String address;

// صورة مرجعية للتصميم
final String referenceImageUrl;

// حالة الطلب
final String status;

// بيانات العرض المختار
final String? selectedOfferId;
final double? finalPrice;
final String? selectedSellerId;

// تاريخ إنشاء الطلب
final DateTime createdAt;

const CustomOrder({
required this.id,
required this.customerId,
required this.descriptionAr,
this.descriptionEn = '',
this.material = '',
this.color = '',
this.size = '',
this.quantity = 1,
this.budget = 0,
this.governorate = '',
this.address = '',
this.referenceImageUrl = '',
this.status = 'pending',
this.selectedOfferId,
this.finalPrice,
this.selectedSellerId,
required this.createdAt,
});

/// تحويل بيانات الطلب إلى Map لحفظها في قاعدة البيانات
Map<String, dynamic> toMap() {
return {
'id': id,
'customerId': customerId,
'descriptionAr': descriptionAr,
'descriptionEn': descriptionEn,
'material': material,
'color': color,
'size': size,
'quantity': quantity,
'budget': budget,
'governorate': governorate,
'address': address,
'referenceImageUrl': referenceImageUrl,
'status': status,
'selectedOfferId': selectedOfferId,
'finalPrice': finalPrice,
'selectedSellerId': selectedSellerId,
'createdAt': createdAt.toIso8601String(),
};
}

/// استرجاع الطلب من بيانات قاعدة البيانات
factory CustomOrder.fromMap(Map<String, dynamic> map) {
return CustomOrder(
id: map['id']?.toString() ?? '',
customerId: map['customerId']?.toString() ?? '',
descriptionAr: map['descriptionAr']?.toString() ?? '',
descriptionEn: map['descriptionEn']?.toString() ?? '',
material: map['material']?.toString() ?? '',
color: map['color']?.toString() ?? '',
size: map['size']?.toString() ?? '',
quantity: (map['quantity'] as num?)?.toInt() ?? 1,
budget: (map['budget'] as num?)?.toDouble() ?? 0,
governorate: map['governorate']?.toString() ?? '',
address: map['address']?.toString() ?? '',
referenceImageUrl: map['referenceImageUrl']?.toString() ?? '',
status: map['status']?.toString() ?? 'pending',
selectedOfferId: map['selectedOfferId']?.toString(),
finalPrice: (map['finalPrice'] as num?)?.toDouble(),
selectedSellerId: map['selectedSellerId']?.toString(),
createdAt: DateTime.tryParse(
map['createdAt']?.toString() ?? '',
) ??
DateTime.now(),
);
}
}
