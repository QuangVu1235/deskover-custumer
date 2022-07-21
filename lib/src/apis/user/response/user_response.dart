import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? username;
  String? fullname;
  String? avatar;
  String? modifiedAt;
  String? lastLogin;
  bool? actived;
  bool? verify;
  String? modifiedBy;

  User(
      {this.id,
        this.username,
        this.fullname,
        this.avatar,
        this.modifiedAt,
        this.lastLogin,
        this.actived,
        this.verify,
        this.modifiedBy
      });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}