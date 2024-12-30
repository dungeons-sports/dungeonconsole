import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.console.g.dart';

enum ConsoleType {
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
  final ConsoleType type;
  final bool multiplayer;
  final int count;
  final double cost;
  final String tsCreated;
  final String tsUpdated;

  const Console({
    required this.type,
    required this.consoleId,
    required this.multiplayer,
    required this.count,
    required this.cost,
    required this.tsCreated,
    required this.tsUpdated,
  });

  factory Console.fromJson(Map<String, dynamic> json) =>
      _$ConsoleFromJson(json);

  Map<String, dynamic> toJson() => _$ConsoleToJson(this);

  const Console.empty()
      : consoleId = '',
        type = ConsoleType.pc,
        multiplayer = false,
        count = 1,
        cost = 0.0,
        tsCreated = '',
        tsUpdated = '';

  Console copyWith({
    String? consoleId,
    ConsoleType? type,
    bool? multiplayer,
    int? count,
    double? cost,
    String? tsCreated,
    String? tsUpdated,
  }) {
    return Console(
      type: type ?? this.type,
      consoleId: consoleId ?? this.consoleId,
      multiplayer: multiplayer ?? this.multiplayer,
      count: count??this.count,
      cost: cost ?? this.cost,
      tsCreated: tsCreated ?? this.tsCreated,
      tsUpdated: tsUpdated ?? this.tsUpdated,
    );
  }

  @override
  List<Object?> get props =>
      [consoleId, multiplayer,count, cost, tsCreated, tsUpdated];
}
