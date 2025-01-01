import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dungeonconsole/helpers/helper.timeExt.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.booking.g.dart';

enum BookingStatus {
  pending,
  confirmed,
  cancelled,
}

@JsonSerializable()
class Booking extends Equatable {
  final String bookingId;
  final String consoleId;
  final String cafeId;

  @TimestampConverter()
  final Timestamp startTime;

  @TimestampConverter()
  final Timestamp endTime;

  final String? customerId;
  final String? customerName;
  final BookingStatus status;
  final String? contactNumber;

  final double cost;
  final String tsCreated;
  final String tsUpdated;

  const Booking({
    required this.bookingId,
    required this.consoleId,
    required this.cafeId,
    required this.startTime,
    required this.endTime,
    this.customerId,
    this.customerName,
    required this.status,
    this.contactNumber,
    required this.cost,
    required this.tsCreated,
    required this.tsUpdated,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);

  @override
  List<Object?> get props => [];
}
