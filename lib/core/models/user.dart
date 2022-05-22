import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? message;
  bool? isSuccess;
  List<Data>? data;

  User({this.message, this.isSuccess, this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? surname;
  String? email;
  String? phone;
  int? userType;
  String? username;
  String? password;
  String? img;
  String? emailConfirmToken;

  Data(
      {this.id,
      this.name,
      this.surname,
      this.email,
      this.phone,
      this.userType,
      this.username,
      this.password,
      this.img,
      this.emailConfirmToken});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}
