
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'model.cafe.g.dart';

@JsonSerializable()
class Cafe extends Equatable {
  final String id;
  // Step One
  final String ownerName;
  final String ownerPhone;
  final String cafeName;
  final String city;
  final String state;

  // Step three
  final bool isGamingChair;
  final bool isWashroom;
  final bool isAC;
  final bool isParking;
  final bool isFoodAllowed;
  final bool isAlwaysOpen;
  final bool isSmokingAllowed;
  final String openTimeUTC;
  final String closeTimeUTC;
  final String topGames;
  final String googleMapsLink;

  final int registerStep;
  final bool isVerified;

  final String tsCreated;
  final String tsUpdated;

  const Cafe({
    required this.id,
    required this.ownerName,
    required this.ownerPhone,
    required this.cafeName,
    required this.city,
    required this.state,
    required this.googleMapsLink,
    required this.topGames,
    required this.isGamingChair,
    required this.isWashroom,
    required this.isAC,
    required this.isParking,
    required this.isFoodAllowed,
    required this.isAlwaysOpen,
    required this.isSmokingAllowed,
    required this.openTimeUTC,
    required this.closeTimeUTC,
    required this.registerStep,
    required this.isVerified,
    required this.tsCreated,
    required this.tsUpdated,
  });

  factory Cafe.fromJson(Map<String, dynamic> json) => _$CafeFromJson(json);

  Map<String, dynamic> toJson() => _$CafeToJson(this);

  const Cafe.empty()
      : id = '',
        ownerName = '',
        ownerPhone = '',
        cafeName = '',
        city = '',
        state = '',
        googleMapsLink = '',
        topGames = '',
        isGamingChair = false,
        isWashroom = false,
        isAC = false,
        isParking = false,
        isFoodAllowed = false,
        isAlwaysOpen = false,
        isSmokingAllowed = false,
        openTimeUTC = '',
        closeTimeUTC = '',
        registerStep = 0,
        isVerified = false,
        tsCreated = '',
        tsUpdated = '';

  Cafe copyWith({
    String? id,
    String? ownerName,
    String? ownerPhone,
    String? cafeName,
    String? city,
    String? state,
    String? googleMapsLink,
    String? topGames,
    bool? isGamingChair,
    bool? isWashroom,
    bool? isAC,
    bool? isParking,
    bool? isFoodAllowed,
    bool? isAlwaysOpen,
    bool? isSmokingAllowed,
    String? openTimeUTC,
    String? closeTimeUTC,
    bool? allowedMembership,
    int? registerStep,
    bool? isVerified,
    String? tsCreated,
    String? tsUpdated,
  }) {
    return Cafe(
      id: id ?? this.id,
      ownerName: ownerName ?? this.ownerName,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      cafeName: cafeName ?? this.cafeName,
      city: city ?? this.city,
      state: state ?? this.state,
      googleMapsLink: googleMapsLink ?? this.googleMapsLink,
      topGames: topGames ?? this.topGames,
      isGamingChair: isGamingChair ?? this.isGamingChair,
      isWashroom: isWashroom ?? this.isWashroom,
      isAC: isAC ?? this.isAC,
      isParking: isParking ?? this.isParking,
      isFoodAllowed: isFoodAllowed ?? this.isFoodAllowed,
      isAlwaysOpen: isAlwaysOpen ?? this.isAlwaysOpen,
      isSmokingAllowed: isSmokingAllowed ?? this.isSmokingAllowed,
      openTimeUTC: openTimeUTC ?? this.openTimeUTC,
      closeTimeUTC: closeTimeUTC ?? this.closeTimeUTC,
      registerStep: registerStep ?? this.registerStep,
      isVerified: isVerified ?? this.isVerified,
      tsCreated: tsCreated ?? this.tsCreated,
      tsUpdated: tsUpdated ?? this.tsUpdated,
    );
  }

  @override
  List<Object?> get props => [
        id,
        ownerName,
        ownerPhone,
        cafeName,
        city,
        state,
        isGamingChair,
        isWashroom,
        isAC,
        isParking,
        isFoodAllowed,
        isAlwaysOpen,
        isSmokingAllowed,
        googleMapsLink,
        topGames,
        openTimeUTC,
        closeTimeUTC,
        tsCreated,
        tsUpdated,
      ];
}
