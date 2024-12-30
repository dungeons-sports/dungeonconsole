import 'package:dungeonconsole/helpers/helper.navigationRoutes.dart';
import 'package:dungeonconsole/helpers/helper.sizes.dart';
import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/services/service.navigation.dart';
import 'package:dungeonconsole/widgets/widget.borderTextField.dart';
import 'package:dungeonconsole/widgets/widget.stackContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  final bool isPartner;
  const SignupPage({super.key, required this.isPartner});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late Size size;
  late Device device;

  void navigate(){
    final navService = locator.get<NavigationService>();
    if(widget.isPartner){
      navService.gotoPage(AppRoutes.partnerWithUs, context);
    } else {
      navService.gotoPage(AppRoutes.dashboardPage, context, replacement: true);
    }
  }

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
                height: size.height * 0.8,
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
                      "Join the Ultimate Gaming Network!",
                      style: GoogleFonts.pixelifySans(fontSize: 36),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 42.0),
                      child: Text(
                        "Whether you're a gamer looking for the perfect spot or a lounge ready to host epic battles, you're just a step away from unlocking endless possibilities. Let’s get started!",
                        style: GoogleFonts.roboto(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Text(
                      "Enter your email",
                      style: GoogleFonts.roboto(
                          fontSize: 18.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    BorderedTextField(
                        hintText: 'Email ID',
                        controller: TextEditingController()),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Create a password",
                      style: GoogleFonts.roboto(
                          fontSize: 18.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    BorderedTextField(
                        hintText: 'Password',
                        controller: TextEditingController()),
                    const SizedBox(height: 32.0),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: [
                        InkWell(
                          onTap: (){
                            navigate();
                          },
                          child: StackedContainer(
                            height: 48.0,
                            width: 220.0,
                            containerSpacing: 4.0,
                            fillColor: Colors.amber,
                            child: Center(
                              child: Text(
                                "Sign-up",
                                style: GoogleFonts.roboto(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            locator.get<NavigationService>().gotoPage(AppRoutes.loginPage, context);
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.center,
                            child: Text("Already have an account? Login now!", style: GoogleFonts.roboto(fontSize:16, color: Colors.white),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      "Or you can use Google",
                      style: GoogleFonts.roboto(
                          fontSize: 18.0, color: Colors.white),
                    ),
                    const SizedBox(height: 12.0),
                    StackedContainer(
                      height: 48.0,
                      width: 220.0,
                      containerSpacing: 4.0,
                      fillColor: Colors.black,
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
                                  fontSize: 18.0, color: Colors.white),
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
