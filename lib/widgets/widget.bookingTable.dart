import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dungeonconsole/models/modelBooking/model.booking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class BookingTable extends StatefulWidget {
  final List<Booking> bookings;

  const BookingTable({super.key, required this.bookings});

  @override
  State<BookingTable> createState() => _BookingTableState();
}

class _BookingTableState extends State<BookingTable> {
  late Stream<DateTime> _timeStream;

  @override
  void initState() {
    super.initState();
    // Create a stream that ticks every second
    _timeStream = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    );
  }

  String formatDateTime(Timestamp timestamp) {
    final dateTime = timestamp.toDate();
    return DateFormat('hh:mm a').format(dateTime); // Format: 12:30 PM
  }

  String calculateRemainingTime(Timestamp endTime, DateTime now) {
    final remaining = endTime.toDate().difference(now);
    if (remaining.isNegative) {
      return 'Expired';
    }
    return '${remaining.inHours.toString().padLeft(2, '0')}:'
        '${(remaining.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(remaining.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnWidth = constraints.maxWidth / 5; // Divide equally among 5 columns

        return StreamBuilder<DateTime>(
          stream: _timeStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final now = snapshot.data!;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: constraints.maxWidth, // Take full width of the screen
                child: DataTable(
                  columnSpacing: 0, // Remove extra spacing between columns
                  columns: [
                    DataColumn(label: SizedBox(width: columnWidth, child: Text('Info', style: GoogleFonts.roboto(fontSize: 16.0),))),
                    DataColumn(label: SizedBox(width: columnWidth, child: Text('Status', style: GoogleFonts.roboto(fontSize: 16.0)))),
                    DataColumn(label: SizedBox(width: columnWidth, child: Text('Start Time', style: GoogleFonts.roboto(fontSize: 16.0)))),
                    DataColumn(label: SizedBox(width: columnWidth, child: Text('End Time', style: GoogleFonts.roboto(fontSize: 16.0)))),
                    DataColumn(label: SizedBox(width: columnWidth, child: Text('Remaining Time', style: GoogleFonts.roboto(fontSize: 16.0)))),
                  ],
                  rows: widget.bookings.map((booking) {
                    final remainingTimeStr = calculateRemainingTime(booking.endTime, now);

                    return DataRow(cells: [
                      DataCell(SizedBox(width: columnWidth, child: Text('Booking on ${booking.consoleName.toUpperCase()}'))),
                      DataCell(SizedBox(width: columnWidth, child: Text(booking.status.name.toUpperCase()))),
                      DataCell(SizedBox(width: columnWidth, child: Text(formatDateTime(booking.startTime)))),
                      DataCell(SizedBox(width: columnWidth, child: Text(formatDateTime(booking.endTime)))),
                      DataCell(SizedBox(width: columnWidth, child: Text(remainingTimeStr))),
                    ]);
                  }).toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
