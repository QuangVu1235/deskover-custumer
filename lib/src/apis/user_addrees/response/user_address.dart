import 'package:json_annotation/json_annotation.dart';
part 'user_address.g.dart';

@JsonSerializable()
class UserAddress{
  int? id;
  Province? province_id;
  String? address;
  String? fullname;
  String? province;
  String? district;
  String? ward;
  String? tel;
  String? email;
  bool? choose;
  bool? actived;

  UserAddress(
      {this.id,
        this.province_id,
        this.address,
        this.fullname,
        this.province,
        this.district,
        this.ward,
        this.tel,
        this.email,
        this.choose,
        this.actived
      });
  factory UserAddress.fromJson(Map<String, dynamic> json) => _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);

}
@JsonSerializable()
class Province{
  int? id;
  String? name;
  String? code;

  Province({this.id,this.name,this.code});

  factory Province.fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);

}