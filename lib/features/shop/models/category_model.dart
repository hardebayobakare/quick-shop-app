import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  // Empty Helper Function
  static CategoryModel empty() {
    return CategoryModel(
      id: '',
      name: '',
      image: '',
      isFeatured: false,
    );
  }

  // Convert model to Json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  // Convert Json to model
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null) {
      final data = snapshot.data()!;
      return CategoryModel(
        id: snapshot.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured']  ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}