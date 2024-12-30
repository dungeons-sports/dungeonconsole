// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.console.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Console _$ConsoleFromJson(Map<String, dynamic> json) => Console(
      type: $enumDecode(_$ConsoleTypeEnumMap, json['type']),
      consoleId: json['consoleId'] as String,
      multiplayer: json['multiplayer'] as bool,
      count: (json['count'] as num).toInt(),
      cost: (json['cost'] as num).toDouble(),
      tsCreated: json['tsCreated'] as String,
      tsUpdated: json['tsUpdated'] as String,
    );

Map<String, dynamic> _$ConsoleToJson(Console instance) => <String, dynamic>{
      'consoleId': instance.consoleId,
      'type': _$ConsoleTypeEnumMap[instance.type]!,
      'multiplayer': instance.multiplayer,
      'count': instance.count,
      'cost': instance.cost,
      'tsCreated': instance.tsCreated,
      'tsUpdated': instance.tsUpdated,
    };

const _$ConsoleTypeEnumMap = {
  ConsoleType.pc: 'pc',
  ConsoleType.ps: 'ps',
  ConsoleType.vr: 'vr',
  ConsoleType.xbox: 'xbox',
  ConsoleType.streaming: 'streaming',
  ConsoleType.simRacing: 'simRacing',
};
