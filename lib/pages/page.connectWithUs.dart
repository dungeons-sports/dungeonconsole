import 'package:dungeonconsole/helpers/helper.sizes.dart';
import 'package:dungeonconsole/widgets/widget.borderTextField.dart';
import 'package:dungeonconsole/widgets/widget.stackContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectWithUsPage extends StatefulWidget {
  const ConnectWithUsPage({super.key});

  @override
  State<ConnectWithUsPage> createState() => _ConnectWithUsPageState();
}

class _ConnectWithUsPageState extends State<ConnectWithUsPage> {
  late Size size;
  late Device device;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    device = BreakpointHelper.device(context);
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
          : Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width > 600 ? 48.0 : 8.0,
              vertical: size.width > 600 ? 24 : 8.0),
          child: Row(
            mainAxisAlignment: size.width > 600
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (size.width > 600)
                SizedBox(
                  height: size.height,
                  child: Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      'assets/images/panda.png',
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                    ),
                  ),
                ),
              if (size.width > 600) const Spacer(),
              StackedContainer(
                  width: size.width > 600 ? size.width * 0.5 : size.width * 0.8,
                  height: size.width > 600 ? size.height * 0.8 : size.height,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width > 600 ? 18.0 : 8.0,
                      vertical: size.width > 600 ? 28.0 : 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Connect with us",
                          style: GoogleFonts.pixelifySans(fontSize: 36),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 42.0),
                          child: Text(
                            "Running a gaming café? We're here to help. Manage bookings effortlessly and access the latest games at great prices through our industry partnerships. Let's work together to make your café even better.\n\nLet's connect shall we? We'd love to hear from you!",
                            style: GoogleFonts.roboto(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 32.0),
                        Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "It's nice to know",
                                style: GoogleFonts.roboto(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              BorderedTextField(
                                hintText: "Your name",
                                controller: TextEditingController(),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                "Are you on Google Maps?",
                                style: GoogleFonts.roboto(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              BorderedTextField(
                                hintText: "Name of the place",
                                controller: TextEditingController(),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                "We'll call you on this one.",
                                style: GoogleFonts.roboto(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              BorderedTextField(
                                hintText: "Phone number",
                                controller: TextEditingController(),
                              ),
                              const SizedBox(
                                height: 32.0,
                              ),
                              StackedContainer(
                                height: 48.0,
                                width: 180.0,
                                containerSpacing: 4.0,
                                fillColor:
                                    const Color.fromARGB(255, 237, 132, 255),
                                child: Center(
                                  child: Text(
                                    "Connect with us",
                                    style: GoogleFonts.roboto(
                                        fontSize: 18.0, color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
