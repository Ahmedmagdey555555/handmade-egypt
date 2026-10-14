class ShippingAddress {
final String id;
final String userId;

// بيانات صاحب العنوان
final String recipientName;
final String phone;

// تفاصيل العنوان
final String governorate;
final String city;
final String district;
final String street;
final String buildingNumber;
final String floor;
final String apartment;
final String landmark;

// نوع العنوان: home / work / other
final String addressType;

// هل هو العنوان الافتراضي؟
final bool isDefault;

// إحداثيات الموقع عند توفرها
final double? latitude;
final double? longitude;

final DateTime createdAt;

const ShippingAddress({
required this.id,
required this.userId,
required this.recipientName,
required this.phone,
required this.governorate,
required this.city,
this.district = '',
this.street = '',
this.buildingNumber = '',
this.floor = '',
this.apartment = '',
this.landmark = '',
this.addressType = 'home',
this.isDefault = false,
this.latitude,
this.longitude,
required this.createdAt,
});

String get fullAddress {
return [
governorate,
city,
district,
street,
if (buildingNumber.isNotEmpty) 'مبنى $buildingNumber',
if (floor.isNotEmpty) 'الدور $floor',
if (apartment.isNotEmpty) 'شقة $apartment',
if (landmark.isNotEmpty) 'علامة مميزة: $landmark',
].where((part) => part.trim().isNotEmpty).join('، ');
}

Map<String, dynamic> toMap() {
return {
'id': id,
'userId': userId,
'recipientName': recipientName,
'phone': phone,
'governorate': governorate,
'city': city,
'district': district,
'street': street,
'buildingNumber': buildingNumber,
'floor': floor,
'apartment': apartment,
'landmark': landmark,
'addressType': addressType,
'isDefault': isDefault,
'latitude': latitude,
'longitude': longitude,
'createdAt': createdAt.toIso8601String(),
};
}

factory ShippingAddress.fromMap(Map<String, dynamic> map) {
return ShippingAddress(
id: map['id']?.toString() ?? '',
userId: map['userId']?.toString() ?? '',
recipientName: map['recipientName']?.toString() ?? '',
phone: map['phone']?.toString() ?? '',
governorate: map['governorate']?.toString() ?? '',
city: map['city']?.toString() ?? '',
district: map['district']?.toString() ?? '',
street: map['street']?.toString() ?? '',
buildingNumber: map['buildingNumber']?.toString() ?? '',
floor: map['floor']?.toString() ?? '',
apartment: map['apartment']?.toString() ?? '',
landmark: map['landmark']?.toString() ?? '',
addressType: map['addressType']?.toString() ?? 'home',
isDefault: map['isDefault'] == true,
latitude: (map['latitude'] as num?)?.toDouble(),
longitude: (map['longitude'] as num?)?.toDouble(),
createdAt: DateTime.tryParse(
map['createdAt']?.toString() ?? '',
) ??
DateTime.now(),
);
}
}
