// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_payment_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: json['id'] as int?,
      paymentId: json['paymentId'] as String?,
      namePayment: json['namePayment'] as String?,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'paymentId': instance.paymentId,
      'namePayment': instance.namePayment,
    };

Shipping _$ShippingFromJson(Map<String, dynamic> json) => Shipping(
      id: json['id'] as int?,
      shippingId: json['shippingId'] as String?,
      nameShipping: json['nameShipping'] as String?,
    );

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
      'id': instance.id,
      'shippingId': instance.shippingId,
      'nameShipping': instance.nameShipping,
    };
