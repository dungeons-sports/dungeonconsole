// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      bookingId: json['bookingId'] as String,
      consoleId: json['consoleId'] as String,
      cafeId: json['cafeId'] as String,
      startTime:
          const TimestampConverter().fromJson(json['startTime'] as Object),
      endTime: const TimestampConverter().fromJson(json['endTime'] as Object),
      customerId: json['customerId'] as String?,
      customerName: json['customerName'] as String?,
      status: $enumDecode(_$BookingStatusEnumMap, json['status']),
      contactNumber: json['contactNumber'] as String?,
      cost: (json['cost'] as num).toDouble(),
      tsCreated: json['tsCreated'] as String,
      tsUpdated: json['tsUpdated'] as String,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'bookingId': instance.bookingId,
      'consoleId': instance.consoleId,
      'cafeId': instance.cafeId,
      'startTime': const TimestampConverter().toJson(instance.startTime),
      'endTime': const TimestampConverter().toJson(instance.endTime),
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'status': _$BookingStatusEnumMap[instance.status]!,
      'contactNumber': instance.contactNumber,
      'cost': instance.cost,
      'tsCreated': instance.tsCreated,
      'tsUpdated': instance.tsUpdated,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.pending: 'pending',
  BookingStatus.confirmed: 'confirmed',
  BookingStatus.cancelled: 'cancelled',
};
