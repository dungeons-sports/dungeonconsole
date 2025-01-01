// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.console.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Console _$ConsoleFromJson(Map<String, dynamic> json) => Console(
      consoleId: json['consoleId'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ConsoleCategoryEnumMap, json['type']),
      multiplayer: json['multiplayer'] as bool,
      cost: (json['cost'] as num).toDouble(),
      tsCreated: json['tsCreated'] as String,
      tsUpdated: json['tsUpdated'] as String,
    );

Map<String, dynamic> _$ConsoleToJson(Console instance) => <String, dynamic>{
      'consoleId': instance.consoleId,
      'name': instance.name,
      'type': _$ConsoleCategoryEnumMap[instance.type]!,
      'multiplayer': instance.multiplayer,
      'cost': instance.cost,
      'tsCreated': instance.tsCreated,
      'tsUpdated': instance.tsUpdated,
    };

const _$ConsoleCategoryEnumMap = {
  ConsoleCategory.pc: 'pc',
  ConsoleCategory.ps: 'ps',
  ConsoleCategory.vr: 'vr',
  ConsoleCategory.xbox: 'xbox',
  ConsoleCategory.streaming: 'streaming',
  ConsoleCategory.simRacing: 'simRacing',
};
