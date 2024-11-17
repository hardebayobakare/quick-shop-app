import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String id;
  String image;
  bool isActive;
  String targetScreen;

  BannerModel({
    required this.id,
    required this.image,
    this.isActive = false,
    this.targetScreen = "",
  });

  // Empty Helper Function
  static BannerModel empty() {
    return BannerModel(
      id: '',
      image: '',
    );
  }

  // Convert model to Json
  Map<String, dynamic> toJson() {
    return {
      'Image': image,
      'IsActive': isActive,
      'TargetScreen': targetScreen,
    };
  }

  // Convert Json to model
  factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null) {
      final data = snapshot.data()!;
      return BannerModel(
        id: snapshot.id,
        image: data['Image'] ?? '',
        isActive: data['IsActive'] ?? false,
      );
    } else {
      return BannerModel.empty();
    }
  }
}