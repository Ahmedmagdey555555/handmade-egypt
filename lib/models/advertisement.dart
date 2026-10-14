class Advertisement {
final String id;
final String sellerId;

// بيانات الإعلان
final String titleAr;
final String titleEn;
final String descriptionAr;
final String descriptionEn;

// الصورة ورابط الوجهة
final String imageUrl;
final String targetUrl;

// مكان ظهور الإعلان داخل التطبيق
// home_banner / category / featured_products
final String placement;

// مدة الإعلان وتكلفته
final DateTime startDate;
final DateTime endDate;
final double price;

// حالة المراجعة: pending / approved / rejected
final String approvalStatus;

// حالة الدفع: pending / paid / failed / refunded
final String paymentStatus;

// حالة الإعلان: active / paused / ended
final String campaignStatus;

// توضيح أن المحتوى ممول
final bool isSponsored;

final DateTime createdAt;

const Advertisement({
required this.id,
required this.sellerId,
required this.titleAr,
this.titleEn = '',
this.descriptionAr = '',
this.descriptionEn = '',
this.imageUrl = '',
this.targetUrl = '',
this.placement = 'home_banner',
required this.startDate,
required this.endDate,
required this.price,
this.approvalStatus = 'pending',
this.paymentStatus = 'pending',
this.campaignStatus = 'paused',
this.isSponsored = true,
required this.createdAt,
});

bool get isApproved => approvalStatus == 'approved';

bool get isPaid => paymentStatus == 'paid';

bool get isWithinDateRange {
final now = DateTime.now();
return !now.isBefore(startDate) && !now.isAfter(endDate);
}

/// شرط مبدئي لظهور الإعلان.
/// يجب فرض هذا الشرط أيضًا داخل الخادم عند ربط قاعدة البيانات.
bool get canBeDisplayed =>
isApproved &&
isPaid &&
campaignStatus == 'active' &&
isWithinDateRange;

Map<String, dynamic> toMap() {
return {
'id': id,
'sellerId': sellerId,
'titleAr': titleAr,
'titleEn': titleEn,
'descriptionAr': descriptionAr,
'descriptionEn': descriptionEn,
'imageUrl': imageUrl,
'targetUrl': targetUrl,
'placement': placement,
'startDate': startDate.toIso8601String(),
'endDate': endDate.toIso8601String(),
'price': price,
'approvalStatus': approvalStatus,
'paymentStatus': paymentStatus,
'campaignStatus': campaignStatus,
'isSponsored': isSponsored,
'createdAt': createdAt.toIso8601String(),
};
}

factory Advertisement.fromMap(Map<String, dynamic> map) {
return Advertisement(
id: map['id']?.toString() ?? '',
sellerId: map['sellerId']?.toString() ?? '',
titleAr: map['titleAr']?.toString() ?? '',
titleEn: map['titleEn']?.toString() ?? '',
descriptionAr: map['descriptionAr']?.toString() ?? '',
descriptionEn: map['descriptionEn']?.toString() ?? '',
imageUrl: map['imageUrl']?.toString() ?? '',
targetUrl: map['targetUrl']?.toString() ?? '',
placement: map['placement']?.toString() ?? 'home_banner',
startDate: DateTime.tryParse(
map['startDate']?.toString() ?? '',
) ??
DateTime.now(),
endDate: DateTime.tryParse(
map['endDate']?.toString() ?? '',
) ??
DateTime.now(),
price: (map['price'] as num?)?.toDouble() ?? 0,
approvalStatus:
map['approvalStatus']?.toString() ?? 'pending',
paymentStatus: map['paymentStatus']?.toString() ?? 'pending',
campaignStatus:
map['campaignStatus']?.toString() ?? 'paused',
isSponsored: map['isSponsored'] != false,
createdAt: DateTime.tryParse(
map['createdAt']?.toString() ?? '',
) ??
DateTime.now(),
);
}
}
