class PaymentMethodModel {
  String name;
  String image;

  PaymentMethodModel({
    required this.name, 
    required this.image
  });

  static PaymentMethodModel empty() => PaymentMethodModel(
    name: '',
    image: ''
  );

  factory PaymentMethodModel.fromMap(Map<String, dynamic> json) {
    return PaymentMethodModel(
      name: json['name'] as String,
      image: json['image'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image
    };
  }
}