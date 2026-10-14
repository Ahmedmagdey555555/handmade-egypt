class Product {
final String id;
final String nameAr;
final String nameEn;
final String descriptionAr;
final String descriptionEn;
final String category;
final double price;
final String sellerId;
final List<String> imageUrls;
final String materials;
final String preparationTime;
final bool isApproved;
final bool isFeatured;

const Product({
required this.id,
required this.nameAr,
required this.nameEn,
required this.descriptionAr,
required this.descriptionEn,
required this.category,
required this.price,
required this.sellerId,
this.imageUrls = const [],
this.materials = '',
this.preparationTime = '',
this.isApproved = false,
this.isFeatured = false,
});

factory Product.fromMap(Map<String, dynamic> map) {
return Product(
id: map['id']?.toString() ?? '',
nameAr: map['nameAr']?.toString() ?? '',
nameEn: map['nameEn']?.toString() ?? '',
descriptionAr: map['descriptionAr']?.toString() ?? '',
descriptionEn: map['descriptionEn']?.toString() ?? '',
category: map['category']?.toString() ?? '',
price: (map['price'] as num?)?.toDouble() ?? 0,
sellerId: map['sellerId']?.toString() ?? '',
imageUrls: (map['imageUrls'] as List<dynamic>?)
?.map((item) => item.toString())
.toList() ??
const [],
materials: map['materials']?.toString() ?? '',
preparationTime: map['preparationTime']?.toString() ?? '',
isApproved: map['isApproved'] == true,
isFeatured: map['isFeatured'] == true,
);
}

Map<String, dynamic> toMap() {
return {
'id': id,
'nameAr': nameAr,
'nameEn': nameEn,
'descriptionAr': descriptionAr,
'descriptionEn': descriptionEn,
'category': category,
'price': price,
'sellerId': sellerId,
'imageUrls': imageUrls,
'materials': materials,
'preparationTime': preparationTime,
'isApproved': isApproved,
'isFeatured': isFeatured,
};
}
}
