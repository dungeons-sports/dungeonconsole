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
      cpu: json['cpu'] as String?,
      gpu: json['gpu'] as String?,
      ram: json['ram'] as String?,
      storage: json['storage'] as String?,
      display: json['display'] as String?,
      installedGames: json['installedGames'] as String?,
      resolution: json['resolution'] as String?,
      consoleType: json['consoleType'] as String?,
      controllerCount: json['controllerCount'] as String?,
      installedGamesOnPSConsole: json['installedGamesOnPSConsole'] as String?,
      xboxResolution: json['xboxResolution'] as String?,
      xboxType: json['xboxType'] as String?,
      xboxControllerCount: json['xboxControllerCount'] as String?,
      installedGamesOnXbox: json['installedGamesOnXbox'] as String?,
      vrType: json['vrType'] as String?,
      installedGamesOnVR: json['installedGamesOnVR'] as String?,
      tsCreated: json['tsCreated'] as String,
      tsUpdated: json['tsUpdated'] as String,
    );

Map<String, dynamic> _$ConsoleToJson(Console instance) => <String, dynamic>{
      'consoleId': instance.consoleId,
      'name': instance.name,
      'type': _$ConsoleCategoryEnumMap[instance.type]!,
      'multiplayer': instance.multiplayer,
      'cost': instance.cost,
      'cpu': instance.cpu,
      'gpu': instance.gpu,
      'ram': instance.ram,
      'storage': instance.storage,
      'display': instance.display,
      'installedGames': instance.installedGames,
      'resolution': instance.resolution,
      'consoleType': instance.consoleType,
      'controllerCount': instance.controllerCount,
      'installedGamesOnPSConsole': instance.installedGamesOnPSConsole,
      'xboxResolution': instance.xboxResolution,
      'xboxType': instance.xboxType,
      'xboxControllerCount': instance.xboxControllerCount,
      'installedGamesOnXbox': instance.installedGamesOnXbox,
      'vrType': instance.vrType,
      'installedGamesOnVR': instance.installedGamesOnVR,
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
