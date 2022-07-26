// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      id: json['id'] as int?,
      province_id: json['province_id'] == null
          ? null
          : Province.fromJson(json['province_id'] as Map<String, dynamic>),
      address: json['address'] as String?,
      fullname: json['fullname'] as String?,
      province: json['province'] as String?,
      district: json['district'] as String?,
      ward: json['ward'] as String?,
      tel: json['tel'] as String?,
      email: json['email'] as String?,
      choose: json['choose'] as bool?,
      actived: json['actived'] as bool?,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'province_id': instance.province_id,
      'address': instance.address,
      'fullname': instance.fullname,
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
      'tel': instance.tel,
      'email': instance.email,
      'choose': instance.choose,
      'actived': instance.actived,
    };

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
