class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  // Empty ProductVariationModel
  static ProductVariationModel empty() => ProductVariationModel(
    id: '',
    attributeValues: {},
  );

  // ProductVariationModel toJson
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Sku': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  // ProductVariationModel fromJson
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'],
      sku: data['Sku'],
      image: data['Image'],
      description: data['Description'],
      price: data['Price'],
      salePrice: data['SalePrice'],
      stock: data['Stock'],
      attributeValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}