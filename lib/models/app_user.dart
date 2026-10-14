class AppUser {
final String id;
final String fullName;
final String email;
final String phone;

// نوع الحساب: customer / seller / admin
final String role;

// بيانات العنوان
final String governorate;
final String city;
final String address;

// صورة الملف الشخصي
final String profileImageUrl;

// حالة الحساب: active / suspended
final String accountStatus;

// اللغة المفضلة: ar / en
final String preferredLanguage;

// تاريخ إنشاء الحساب
final DateTime createdAt;

const AppUser({
required this.id,
required this.fullName,
this.email = '',
this.phone = '',
this.role = 'customer',
this.governorate = '',
this.city = '',
this.address = '',
this.profileImageUrl = '',
this.accountStatus = 'active',
this.preferredLanguage = 'ar',
required this.createdAt,
});

bool get isActive => accountStatus == 'active';

bool get isCustomer => role == 'customer';

bool get isSeller => role == 'seller';

bool get isAdmin => role == 'admin';

Map<String, dynamic> toMap() {
return {
'id': id,
'fullName': fullName,
'email': email,
'phone': phone,
'role': role,
'governorate': governorate,
'city': city,
'address': address,
'profileImageUrl': profileImageUrl,
'accountStatus': accountStatus,
'preferredLanguage': preferredLanguage,
'createdAt': createdAt.toIso8601String(),
};
}

factory AppUser.fromMap(Map<String, dynamic> map) {
return AppUser(
id: map['id']?.toString() ?? '',
fullName: map['fullName']?.toString() ?? '',
email: map['email']?.toString() ?? '',
phone: map['phone']?.toString() ?? '',
role: map['role']?.toString() ?? 'customer',
governorate: map['governorate']?.toString() ?? '',
city: map['city']?.toString() ?? '',
address: map['address']?.toString() ?? '',
profileImageUrl: map['profileImageUrl']?.toString() ?? '',
accountStatus: map['accountStatus']?.toString() ?? 'active',
preferredLanguage: map['preferredLanguage']?.toString() ?? 'ar',
createdAt: DateTime.tryParse(
map['createdAt']?.toString() ?? '',
) ??
DateTime.now(),
);
}
}
