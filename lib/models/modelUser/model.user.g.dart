// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      isPlayer: json['isPlayer'] as bool,
      isCafe: json['isCafe'] as bool,
      cafeId: json['cafeId'] as String?,
      tsCreated: json['tsCreated'] as String,
      tsUpdated: json['tsUpdated'] as String,
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'isPlayer': instance.isPlayer,
      'isCafe': instance.isCafe,
      'cafeId': instance.cafeId,
      'tsCreated': instance.tsCreated,
      'tsUpdated': instance.tsUpdated,
    };
