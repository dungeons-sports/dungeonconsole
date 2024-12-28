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
      body: Padding(
          padding: PaddingRatioHelper.getDisplayPadding(size),
          child: Row(
            mainAxisAlignment: device == Device.desktop
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (device == Device.desktop)
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
              if (device == Device.desktop) const Spacer(),
              StackedContainer(
                  width: device == Device.desktop
                      ? size.width * 0.5
                      : size.width * 0.8,
                  height: device == Device.desktop? size.height * 0.8: size.height,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 28.0),
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
