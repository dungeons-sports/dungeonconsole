import 'package:dungeonconsole/pages/Dashboard/DashTabs/TabUpcomingBooking/vm.upcomingBookings.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:dungeonconsole/widgets/widget.bookingTable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpcomingBookingTab extends StatefulWidget {
  final VMDashboard vmdash;
  const UpcomingBookingTab({super.key, required this.vmdash});

  @override
  State<UpcomingBookingTab> createState() => _UpcomingBookingTabState();
}

class _UpcomingBookingTabState extends State<UpcomingBookingTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<VMUpcomingBooking>(
      create: (context) => VMUpcomingBooking(widget.vmdash.cafeDetails!.id),
      builder: (context, child) {
        return Container(
            color: Colors.grey[900],
            padding: const EdgeInsets.all(18.0),
            child: Consumer<VMUpcomingBooking>(
              builder: (context, vm, details) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming Bookings',
                      style: GoogleFonts.roboto(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'View today\'s bookings and upcoming bookings',
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                    const SizedBox(height: 24.0),
                    Container(
                      height: 2.0,
                      width: size.width - 350,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 24.0),
                    // Booking list.
                    if (!vm.isLoading && !vm.showNoResults)
                      BookingTable(bookings: vm.upcomingBookings),

                    if (!vm.isLoading && vm.showNoResults) ...[
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/dragon.png',
                              width: 250,
                              height: 250,
                            ),
                            const SizedBox(height: 24.0),
                            Text(
                              'No bookings found for today',
                              style: GoogleFonts.roboto(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ]
                  ],
                );
              },
            ));
      },
    );
  }
}
