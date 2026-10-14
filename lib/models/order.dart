class OrderItem {
final String productId;
final String productNameAr;
final String productNameEn;
final int quantity;
final double unitPrice;
final String imageUrl;
final String sellerId;

const OrderItem({
required this.productId,
required this.productNameAr,
this.productNameEn = '',
required this.quantity,
required this.unitPrice,
this.imageUrl = '',
required this.sellerId,
});

double get totalPrice => quantity * unitPrice;

Map<String, dynamic> toMap() {
return {
'productId': productId,
'productNameAr': productNameAr,
'productNameEn': productNameEn,
'quantity': quantity,
'unitPrice': unitPrice,
'imageUrl': imageUrl,
'sellerId': sellerId,
};
}

factory OrderItem.fromMap(Map<String, dynamic> map) {
return OrderItem(
productId: map['productId']?.toString() ?? '',
productNameAr: map['productNameAr']?.toString() ?? '',
productNameEn: map['productNameEn']?.toString() ?? '',
quantity: (map['quantity'] as num?)?.toInt() ?? 1,
unitPrice: (map['unitPrice'] as num?)?.toDouble() ?? 0,
imageUrl: map['imageUrl']?.toString() ?? '',
sellerId: map['sellerId']?.toString() ?? '',
);
}
}

class CustomerOrder {
final String id;
final String customerId;
final List<OrderItem> items;

// بيانات التوصيل
final String customerName;
final String phone;
final String governorate;
final String city;
final String address;
final String shippingCompany;
final String trackingNumber;

// المبالغ
final double subtotal;
final double shippingFee;
final double discount;
final double total;

// الدفع الإلكتروني
final String paymentMethod;
final String paymentStatus;
final String paymentTransactionId;

// حالة الطلب
final String status;
final String notes;

final DateTime createdAt;
final DateTime? deliveredAt;

const CustomerOrder({
required this.id,
required this.customerId,
required this.items,
required this.customerName,
required this.phone,
required this.governorate,
required this.city,
required this.address,
this.shippingCompany = '',
this.trackingNumber = '',
required this.subtotal,
this.shippingFee = 0,
this.discount = 0,
required this.total,
this.paymentMethod = 'online',
this.paymentStatus = 'pending',
this.paymentTransactionId = '',
this.status = 'pending',
this.notes = '',
required this.createdAt,
this.deliveredAt,
});

bool get isPaid => paymentStatus == 'paid';

bool get isCancelled => status == 'cancelled';

Map<String, dynamic> toMap() {
return {
'id': id,
'customerId': customerId,
'items': items.map((item) => item.toMap()).toList(),
'customerName': customerName,
'phone': phone,
'governorate': governorate,
'city': city,
'address': address,
'shippingCompany': shippingCompany,
'trackingNumber': trackingNumber,
'subtotal': subtotal,
'shippingFee': shippingFee,
'discount': discount,
'total': total,
'paymentMethod': paymentMethod,
'paymentStatus': paymentStatus,
'paymentTransactionId': paymentTransactionId,
'status': status,
'notes': notes,
'createdAt': createdAt.toIso8601String(),
'deliveredAt': deliveredAt?.toIso8601String(),
};
}

factory CustomerOrder.fromMap(Map<String, dynamic> map) {
final rawItems = map['items'] as List<dynamic>? ?? [];

return CustomerOrder(
  id: map['id']?.toString() ?? '',
  customerId: map['customerId']?.toString() ?? '',
  items: rawItems
      .whereType<Map>()
      .map(
        (item) => OrderItem.fromMap(
          Map<String, dynamic>.from(item),
        ),
      )
      .toList(),
  customerName: map['customerName']?.toString() ?? '',
  phone: map['phone']?.toString() ?? '',
  governorate: map['governorate']?.toString() ?? '',
  city: map['city']?.toString() ?? '',
  address: map['address']?.toString() ?? '',
  shippingCompany: map['shippingCompany']?.toString() ?? '',
  trackingNumber: map['trackingNumber']?.toString() ?? '',
  subtotal: (map['subtotal'] as num?)?.toDouble() ?? 0,
  shippingFee: (map['shippingFee'] as num?)?.toDouble() ?? 0,
  discount: (map['discount'] as num?)?.toDouble() ?? 0,
  total: (map['total'] as num?)?.toDouble() ?? 0,
  paymentMethod: map['paymentMethod']?.toString() ?? 'online',
  paymentStatus: map['paymentStatus']?.toString() ?? 'pending',
  paymentTransactionId:
      map['paymentTransactionId']?.toString() ?? '',
  status: map['status']?.toString() ?? 'pending',
  notes: map['notes']?.toString() ?? '',
  createdAt: DateTime.tryParse(
        map['createdAt']?.toString() ?? '',
      ) ??
      DateTime.now(),
  deliveredAt: DateTime.tryParse(
    map['deliveredAt']?.toString() ?? '',
  ),
);

}
}
