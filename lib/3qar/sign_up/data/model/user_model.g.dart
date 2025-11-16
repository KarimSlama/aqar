// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      userType: json['user_type'] as String?,
      id: json['id'] as String?,
      aboutMe: json['about_me'] as String?,
      createdAt: json['created_at'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'about_me': instance.aboutMe,
      'image': instance.image,
      'user_type': instance.userType,
      'created_at': instance.createdAt,
    };
