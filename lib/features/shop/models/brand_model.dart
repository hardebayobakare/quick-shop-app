class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  bool isVerified;
  int? productCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.isVerified = false,
    this.productCount,
  });

  // Empty BrandModel
  static BrandModel empty() => BrandModel(
    id: '',
    name: '',
    image: '',
  );

  // BrandModel toJson
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'IsVerified': isVerified,
      'ProductCount': productCount,
    };
  }

  // BrandModel fromJson
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'],
      name: data['Name'],
      image: data['Image'],
      isFeatured: data['IsFeatured'],
      isVerified: data['IsVerified'],
      productCount: data['ProductCount'],
    );
  }
}