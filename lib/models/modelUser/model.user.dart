import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'model.user.g.dart';

@JsonSerializable()
class AppUser extends Equatable {
  final String id;
  final String email;
  final bool isPlayer;
  final bool isCafe;

  final String? cafeId;

  final String tsCreated;
  final String tsUpdated;

  const AppUser({
    required this.id,
    required this.email,
    required this.isPlayer,
    required this.isCafe,
    required this.cafeId,
    required this.tsCreated,
    required this.tsUpdated,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  const AppUser.empty()
      : id = '',
        email = '',
        isPlayer = false,
        isCafe = false,
        cafeId = '',
        tsCreated = '',
        tsUpdated = '';

  AppUser copyWith({
    String? id,
    String? email,
    bool? isPlayer,
    bool? isCafe,
    String? cafeId,
    String? tsCreated,
    String? tsUpdated,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      isPlayer: isPlayer ?? this.isPlayer,
      isCafe: isCafe ?? this.isCafe,
      cafeId: cafeId ?? this.cafeId,
      tsCreated: tsCreated ?? this.tsCreated,
      tsUpdated: tsUpdated ?? this.tsUpdated,
    );
  }

  @override
  List<Object?> get props => [id, email, isPlayer, isCafe, cafeId, tsCreated, tsUpdated];
}