import 'package:dungeonconsole/widgets/widget.borderDropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBookingTab extends StatefulWidget {
  const CreateBookingTab({super.key});

  @override
  State<CreateBookingTab> createState() => _CreateBookingTabState();
}

class _CreateBookingTabState extends State<CreateBookingTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Booking', style: GoogleFonts.roboto(fontSize: 24.0, fontWeight: FontWeight.bold),),
          const SizedBox(height: 12.0),
          Text('Create booking for offline visiting player', style: GoogleFonts.roboto(fontSize: 20),),
          const SizedBox(height: 24.0),
          Container(
            height: 2.0,
            width: size.width - 350,
            color: Colors.white,
          ),
          const SizedBox(height: 24.0),
          BorderDropDown(items: [
            "PC1", "PC2", "PC3", "PC4", "PC5",
          ], labelText: "Select a Console", onChanged: (value){})
        ],
      ),
    );
  }
}