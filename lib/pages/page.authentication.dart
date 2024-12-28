import 'package:dungeonconsole/helpers/helper.sizes.dart';
import 'package:dungeonconsole/widgets/widget.stackContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
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
                      'assets/images/cat.png',
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
                height:
                    device == Device.desktop ? size.height * 0.6 : size.height,
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/app_icon.png',
                      width: 90.0,
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.pixelifySans(fontSize: 36),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 42.0),
                      child: Text(
                        "Login to manage your bookings. Just one click and you'll be in.",
                        style: GoogleFonts.roboto(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    StackedContainer(
                      height: 48.0,
                      width: 220.0,
                      containerSpacing: 4.0,
                      fillColor: Colors.greenAccent,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/google_icon.png',
                              width: 30.0,
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Text(
                              "Google Login",
                              style: GoogleFonts.roboto(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
