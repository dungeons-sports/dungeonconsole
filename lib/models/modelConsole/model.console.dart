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
  final String tsCreated;
  final String tsUpdated;

  const Console({
    required this.consoleId,
    required this.name,
    required this.type,
    required this.multiplayer,
    required this.cost,
    required this.tsCreated,
    required this.tsUpdated,
  });

  factory Console.fromJson(Map<String, dynamic> json) =>
      _$ConsoleFromJson(json);

  Map<String, dynamic> toJson() => _$ConsoleToJson(this);

  const Console.empty()
      : consoleId = '',
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
    int? count,
    double? cost,
    String? tsCreated,
    String? tsUpdated,
  }) {
    return Console(
      type: type ?? this.type,
      name: name ?? this.name,
      consoleId: consoleId ?? this.consoleId,
      multiplayer: multiplayer ?? this.multiplayer,
      cost: cost ?? this.cost,
      tsCreated: tsCreated ?? this.tsCreated,
      tsUpdated: tsUpdated ?? this.tsUpdated,
    );
  }

  @override
  List<Object?> get props =>
      [consoleId, multiplayer, name, cost, tsCreated, tsUpdated];
}
