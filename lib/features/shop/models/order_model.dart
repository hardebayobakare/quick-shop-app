import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_shop_app/features/personalization/models/address_model.dart';
import 'package:quick_shop_app/features/shop/models/cart_item_model.dart';
import 'package:quick_shop_app/features/shop/models/payment_method_model.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final AddressModel? address;
  final List<CartItemModel> cartItems;
  final DateTime? deliveryDate;
  final DateTime orderDate;
  final PaymentMethodModel paymentMethod;
  final OrderStatus status;
  final double totalAmount;


  OrderModel({
    required this.id,
    required this.userId,
    required this.address,
    required this.cartItems,
    required this.orderDate,
    required this.paymentMethod,
    required this.status,
    required this.totalAmount,
    this.deliveryDate,
  });

  String get formattedOrderDate => CustomHelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null ? CustomHelperFunctions.getFormattedDate(deliveryDate!) : CustomTextStrings.unavailable;

  String get orderStatusText => status == OrderStatus.delivered 
    ? 'Delivered' 
    : status == OrderStatus.shipped 
      ? 'Shipping on the way' 
      : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'address': address?.toJson(),
      'cartItems': cartItems.map((item) => item.toJson()).toList(),
      'orderDate': orderDate,
      'paymentMethod': paymentMethod.toJson(),
      'status': status.toString(),
      'totalAmount': totalAmount,
      'deliveryDate': deliveryDate,
    };
  }

  factory OrderModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return OrderModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      cartItems: (data['cartItems'] as List<dynamic>).map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)).toList(),
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: PaymentMethodModel.fromMap(data['paymentMethod'] as Map<String, dynamic>),
      status: OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      totalAmount: data['totalAmount'] as double,
      deliveryDate: data['deliveryDate'] != null ? (data['deliveryDate'] as Timestamp).toDate() : null,
    );
  }

  



}