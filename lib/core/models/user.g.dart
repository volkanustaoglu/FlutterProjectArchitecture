// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      message: json['message'] as String?,
      isSuccess: json['isSuccess'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      userType: json['userType'] as int?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      img: json['img'] as String?,
      emailConfirmToken: json['emailConfirmToken'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone': instance.phone,
      'userType': instance.userType,
      'username': instance.username,
      'password': instance.password,
      'img': instance.img,
      'emailConfirmToken': instance.emailConfirmToken,
    };
