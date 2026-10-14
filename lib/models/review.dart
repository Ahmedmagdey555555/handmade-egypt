class Review {
final String id;
final String customerId;
final String orderId;

// المنتج أو المتجر الذي يتم تقييمه
final String productId;
final String sellerId;

// التقييم من نجمة إلى خمس نجوم
final int rating;

// التعليق بالعربية والإنجليزية
final String commentAr;
final String commentEn;

// صور اختيارية للتجربة
final List<String> imageUrls;

// حالة المراجعة
final String status;

// رد صاحب المتجر
final String sellerReply;

final DateTime createdAt;

const Review({
required this.id,
required this.customerId,
required this.orderId,
this.productId = '',
this.sellerId = '',
required this.rating,
this.commentAr = '',
this.commentEn = '',
this.imageUrls = const [],
this.status = 'pending',
this.sellerReply = '',
required this.createdAt,
});

bool get isValidRating => rating >= 1 && rating <= 5;

bool get isApproved => status == 'approved';

Map<String, dynamic> toMap() {
return {
'id': id,
'customerId': customerId,
'orderId': orderId,
'productId': productId,
'sellerId': sellerId,
'rating': rating,
'commentAr': commentAr,
'commentEn': commentEn,
'imageUrls': imageUrls,
'status': status,
'sellerReply': sellerReply,
'createdAt': createdAt.toIso8601String(),
};
}

factory Review.fromMap(Map<String, dynamic> map) {
return Review(
id: map['id']?.toString() ?? '',
customerId: map['customerId']?.toString() ?? '',
orderId: map['orderId']?.toString() ?? '',
productId: map['productId']?.toString() ?? '',
sellerId: map['sellerId']?.toString() ?? '',
rating: (map['rating'] as num?)?.toInt() ?? 0,
commentAr: map['commentAr']?.toString() ?? '',
commentEn: map['commentEn']?.toString() ?? '',
imageUrls: (map['imageUrls'] as List<dynamic>?)
?.map((item) => item.toString())
.toList() ??
const [],
status: map['status']?.toString() ?? 'pending',
sellerReply: map['sellerReply']?.toString() ?? '',
createdAt: DateTime.tryParse(
map['createdAt']?.toString() ?? '',
) ??
DateTime.now(),
);
}
}
