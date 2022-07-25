import 'package:json_annotation/json_annotation.dart';
part 'shipping_payment_status.g.dart';

@JsonSerializable()
class Payment {
  int? id;
  String? paymentId;
  String? namePayment;

  Payment({this.id, this.paymentId, this.namePayment});

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentToJson(this);

}

@JsonSerializable()
class Shipping {
  int? id;
  String? shippingId;
  String? nameShipping;

  Shipping({this.id, this.shippingId, this.nameShipping});

  factory Shipping.fromJson(Map<String, dynamic> json) => _$ShippingFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingToJson(this);

}