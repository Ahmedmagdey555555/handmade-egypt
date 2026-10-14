class SellerOffer {
final String id;
final String customOrderId;
final String sellerId;

// تفاصيل العرض
final double price;
final String materials;
final String description;
final int preparationDays;

// تفاصيل إضافية
final String notes;
final bool isAvailable;

// حالة العرض: pending / accepted / rejected
final String status;

// تاريخ تقديم العرض
final DateTime createdAt;

const SellerOffer({
required this.id,
required this.customOrderId,
required this.sellerId,
required this.price,
this.materials = '',
this.description = '',
this.preparationDays = 1,
this.notes = '',
this.isAvailable = true,
this.status = 'pending',
required this.createdAt,
});

/// تحويل العرض إلى Map لحفظه في قاعدة البيانات
Map<String, dynamic> toMap() {
return {
'id': id,
'customOrderId': customOrderId,
'sellerId': sellerId,
'price': price,
'materials': materials,
'description': description,
'preparationDays': preparationDays,
'notes': notes,
'isAvailable': isAvailable,
'status': status,
'createdAt': createdAt.toIso8601String(),
};
}

/// إنشاء عرض من بيانات قاعدة البيانات
factory SellerOffer.fromMap(Map<String, dynamic> map) {
return SellerOffer(
id: map['id']?.toString() ?? '',
customOrderId: map['customOrderId']?.toString() ?? '',
sellerId: map['sellerId']?.toString() ?? '',
price: (map['price'] as num?)?.toDouble() ?? 0,
materials: map['materials']?.toString() ?? '',
description: map['description']?.toString() ?? '',
preparationDays:
(map['preparationDays'] as num?)?.toInt() ?? 1,
notes: map['notes']?.toString() ?? '',
isAvailable: map['isAvailable'] != false,
status: map['status']?.toString() ?? 'pending',
createdAt: DateTime.tryParse(
map['createdAt']?.toString() ?? '',
) ??
DateTime.now(),
);
}
}
