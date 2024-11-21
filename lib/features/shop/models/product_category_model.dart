import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({
    required this.productId,
    required this.categoryId,
  });


  // Convert model to Json
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'CategoryId': categoryId,
    };
  }

  // Convert Json to model
  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
      productId: data['productId'] as String,
      categoryId: data['categoryId'] as String,
    );
  }

}