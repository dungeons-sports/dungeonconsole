// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.cafe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cafe _$CafeFromJson(Map<String, dynamic> json) => Cafe(
      id: json['id'] as String,
      ownerName: json['ownerName'] as String,
      ownerPhone: json['ownerPhone'] as String,
      cafeName: json['cafeName'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      googleMapsLink: json['googleMapsLink'] as String,
      topGames: json['topGames'] as String,
      consoleType: (json['consoleType'] as List<dynamic>)
          .map((e) => Console.fromJson(e as Map<String, dynamic>))
          .toList(),
      isGamingChair: json['isGamingChair'] as bool,
      isWashroom: json['isWashroom'] as bool,
      isAC: json['isAC'] as bool,
      isParking: json['isParking'] as bool,
      isFoodAllowed: json['isFoodAllowed'] as bool,
      isAlwaysOpen: json['isAlwaysOpen'] as bool,
      isSmokingAllowed: json['isSmokingAllowed'] as bool,
      openTimeUTC: json['openTimeUTC'] as String,
      closeTimeUTC: json['closeTimeUTC'] as String,
      tsCreated: json['tsCreated'] as String,
      tsUpdated: json['tsUpdated'] as String,
    );

Map<String, dynamic> _$CafeToJson(Cafe instance) => <String, dynamic>{
      'id': instance.id,
      'ownerName': instance.ownerName,
      'ownerPhone': instance.ownerPhone,
      'cafeName': instance.cafeName,
      'city': instance.city,
      'state': instance.state,
      'consoleType': instance.consoleType,
      'isGamingChair': instance.isGamingChair,
      'isWashroom': instance.isWashroom,
      'isAC': instance.isAC,
      'isParking': instance.isParking,
      'isFoodAllowed': instance.isFoodAllowed,
      'isAlwaysOpen': instance.isAlwaysOpen,
      'isSmokingAllowed': instance.isSmokingAllowed,
      'openTimeUTC': instance.openTimeUTC,
      'closeTimeUTC': instance.closeTimeUTC,
      'topGames': instance.topGames,
      'googleMapsLink': instance.googleMapsLink,
      'tsCreated': instance.tsCreated,
      'tsUpdated': instance.tsUpdated,
    };
