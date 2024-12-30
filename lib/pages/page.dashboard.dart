import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: size.width < 600 || size.height < 500
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cat.png',
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(height: 20),
                  Center(
                      child: Text(
                    "Managing is not supported on Mobile Devices\nSwitch to Desktop",
                    style: GoogleFonts.pixelifySans(fontSize: 16),
                    textAlign: TextAlign.center,
                  ))
                ],
              ))
          : Container(),
    );
  }
}