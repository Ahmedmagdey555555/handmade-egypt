class Seller {
final String id;
final String ownerName;
final String storeNameAr;
final String storeNameEn;
final String phone;
final String email;
final String governorate;
final String address;
final String descriptionAr;
final String descriptionEn;

// أنواع المنتجات التي يقدمها المتجر
final List<String> categories;

// حالة طلب الانضمام: pending / approved / rejected
final String approvalStatus;

// حالة المتجر: active / suspended
final String storeStatus;

// بيانات التقييم
final double rating;
final int reviewsCount;

// بيانات إضافية
final String logoUrl;
final DateTime createdAt;

const Seller({
required this.id,
required this.ownerName,
required this.storeNameAr,
this.storeNameEn = '',
required this.phone,
this.email = '',
required this.governorate,
this.address = '',
this.descriptionAr = '',
this.descriptionEn = '',
this.categories = const [],
this.approvalStatus = 'pending',
this.storeStatus = 'active',
this.rating = 0,
this.reviewsCount = 0,
this.logoUrl = '',
required this.createdAt,
});

bool get isApproved => approvalStatus == 'approved';

bool get isActive =>
isApproved && storeStatus == 'active';

Map<String, dynamic> toMap() {
return {
'id': id,
'ownerName': ownerName,
'storeNameAr': storeNameAr,
'storeNameEn': storeNameEn,
'phone': phone,
'email': email,
'governorate': governorate,
'address': address,
'descriptionAr': descriptionAr,
'descriptionEn': descriptionEn,
'categories': categories,
'approvalStatus': approvalStatus,
'storeStatus': storeStatus,
'rating': rating,
'reviewsCount': reviewsCount,
'logoUrl': logoUrl,
'createdAt': createdAt.toIso8601String(),
};
}

factory Seller.fromMap(Map<String, dynamic> map) {
return Seller(
id: map['id']?.toString() ?? '',
ownerName: map['ownerName']?.toString() ?? '',
storeNameAr: map['storeNameAr']?.toString() ?? '',
storeNameEn: map['storeNameEn']?.toString() ?? '',
phone: map['phone']?.toString() ?? '',
email: map['email']?.toString() ?? '',
governorate: map['governorate']?.toString() ?? '',
address: map['address']?.toString() ?? '',
descriptionAr: map['descriptionAr']?.toString() ?? '',
descriptionEn: map['descriptionEn']?.toString() ?? '',
categories: (map['categories'] as List<dynamic>?)
?.map((item) => item.toString())
.toList() ??
const [],
approvalStatus:
map['approvalStatus']?.toString() ?? 'pending',
storeStatus: map['storeStatus']?.toString() ?? 'active',
rating: (map['rating'] as num?)?.toDouble() ?? 0,
reviewsCount:
(map['reviewsCount'] as num?)?.toInt() ?? 0,
logoUrl: map['logoUrl']?.toString() ?? '',
createdAt: DateTime.tryParse(
map['createdAt']?.toString() ?? '',
) ??
DateTime.now(),
);
}
}
