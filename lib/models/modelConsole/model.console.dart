import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.console.g.dart';

enum ConsoleCategory {
  pc,
  ps,
  vr,
  xbox,
  streaming,
  simRacing,
}

@JsonSerializable()
class Console extends Equatable {
  final String consoleId;
  final String name;
  final ConsoleCategory type;
  final bool multiplayer;
  final double cost;

  // Display Information on PCs
  final String? cpu;
  final String? gpu;
  final String? ram;
  final String? storage;
  final String? display;
  final String? installedGames;

  // Display Information on Consoles
  final String? resolution;
  final String? consoleType;
  final String? controllerCount;
  final String? installedGamesOnPSConsole;

  // Display Information on XBox
  final String? xboxResolution;
  final String? xboxType;
  final String? xboxControllerCount;
  final String? installedGamesOnXbox;

  // Display Information on VR
  final String? vrType;
  final String? installedGamesOnVR;

  final String tsCreated;
  final String tsUpdated;

  const Console({
    required this.consoleId,
    required this.name,
    required this.type,
    required this.multiplayer,
    required this.cost,
    this.cpu,
    this.gpu,
    this.ram,
    this.storage,
    this.display,
    this.installedGames,
    this.resolution,
    this.consoleType,
    this.controllerCount,
    this.installedGamesOnPSConsole,
    this.xboxResolution,
    this.xboxType,
    this.xboxControllerCount,
    this.installedGamesOnXbox,
    this.vrType,
    this.installedGamesOnVR,
    required this.tsCreated,
    required this.tsUpdated,
  });

  factory Console.fromJson(Map<String, dynamic> json) =>
      _$ConsoleFromJson(json);

  Map<String, dynamic> toJson() => _$ConsoleToJson(this);

  const Console.empty()
      : cpu = null,
        gpu = null,
        ram = null,
        storage = null,
        display = null,
        installedGames = null,
        resolution = null,
        consoleType = null,
        controllerCount = null,
        installedGamesOnPSConsole = null,
        xboxResolution = null,
        xboxType = null,
        xboxControllerCount = null,
        installedGamesOnXbox = null,
        vrType = null,
        installedGamesOnVR = null,
        consoleId = '',
        name = '',
        type = ConsoleCategory.pc,
        multiplayer = false,
        cost = 0.0,
        tsCreated = '',
        tsUpdated = '';

  Console copyWith({
    String? consoleId,
    String? name,
    ConsoleCategory? type,
    bool? multiplayer,
    double? cost,
    String? cpu,
    String? gpu,
    String? ram,
    String? storage,
    String? display,
    String? installedGames,
    String? resolution,
    String? consoleType,
    String? controllerCount,
    String? installedGamesOnPSConsole,
    String? xboxResolution,
    String? xboxType,
    String? xboxControllerCount,
    String? installedGamesOnXbox,
    String? vrType,
    String? installedGamesOnVR,
    String? tsCreated,
    String? tsUpdated,
  }) {
    return Console(
      consoleId: consoleId ?? this.consoleId,
      name: name ?? this.name,
      type: type ?? this.type,
      multiplayer: multiplayer ?? this.multiplayer,
      cost: cost ?? this.cost,
      cpu: cpu ?? this.cpu,
      gpu: gpu ?? this.gpu,
      ram: ram ?? this.ram,
      storage: storage ?? this.storage,
      display: display ?? this.display,
      installedGames: installedGames ?? this.installedGames,
      resolution: resolution ?? this.resolution,
      consoleType: consoleType ?? this.consoleType,
      controllerCount: controllerCount ?? this.controllerCount,
      installedGamesOnPSConsole:
          installedGamesOnPSConsole ?? this.installedGamesOnPSConsole,
      xboxResolution: xboxResolution ?? this.xboxResolution,
      xboxType: xboxType ?? this.xboxType,
      xboxControllerCount: xboxControllerCount ?? this.xboxControllerCount,
      installedGamesOnXbox: installedGamesOnXbox ?? this.installedGamesOnXbox,
      vrType: vrType ?? this.vrType,
      installedGamesOnVR: installedGamesOnVR ?? this.installedGamesOnVR,
      tsCreated: tsCreated ?? this.tsCreated,
      tsUpdated: tsUpdated ?? this.tsUpdated,
    );
  }

  @override
  List<Object?> get props => [
        consoleId,
        name,
        type,
        multiplayer,
        cost,
        cpu,
        gpu,
        ram,
        storage,
        display,
        installedGames,
        resolution,
        consoleType,
        controllerCount,
        installedGamesOnPSConsole,
        xboxResolution,
        xboxType,
        xboxControllerCount,
        installedGamesOnXbox,
        vrType,
        installedGamesOnVR,
        tsCreated,
        tsUpdated,
      ];
}
