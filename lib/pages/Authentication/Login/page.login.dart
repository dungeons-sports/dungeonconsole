import 'package:dungeonconsole/helpers/helper.navigationRoutes.dart';
import 'package:dungeonconsole/helpers/helper.sizes.dart';
import 'package:dungeonconsole/pages/Authentication/Login/vm.login.dart';
import 'package:dungeonconsole/widgets/widget.borderTextField.dart';
import 'package:dungeonconsole/widgets/widget.stackContainer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Device device = BreakpointHelper.device(context);
    return Scaffold(
      body: size.width < 600 || size.height < 500
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cat.png',
                    width: 200,
                    height: 200,
                  ),
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
                  horizontal: size.width > 600 ? 48.0 : 12.0, vertical: 24),
              child: Row(
                mainAxisAlignment: device == Device.desktop
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
                          'assets/images/cat.png',
                          width: size.width * 0.3,
                          height: size.width * 0.3,
                        ),
                      ),
                    ),
                  if (size.width > 600) const Spacer(),
                  StackedContainer(
                    width:
                        size.width > 600 ? size.width * 0.5 : size.width * 0.9,
                    height: size.height,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 28.0),
                    child: SingleChildScrollView(child:
                        Consumer<VMLogin>(builder: (context, vm, detail) {
                      if (vm.onLoginError) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                                SnackBar(
                                  content: Text(vm.loginErrorMessage),
                                  backgroundColor: Colors.red,
                                ),
                              )
                              .closed
                              .then((_) {
                            vm.clearLoginErrorMessage();
                          });
                        });
                      }

                      return Column(
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
                              "Welcome to the best gaming community there is. Log in to manage your lounge, book your next session, or join tournaments. Together, let's make gaming unforgettable.",
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
                              controller: vm.emailController),
                          if (!vm.isEmailValid) ...[
                            const SizedBox(height: 8.0),
                            Text(vm.emailErrorMessage,
                                style: GoogleFonts.roboto(
                                    fontSize: 14.0, color: Colors.red))
                          ],
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            "And your password obviously..",
                            style: GoogleFonts.roboto(
                                fontSize: 18.0, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          BorderedTextField(
                              hintText: 'Password',
                              isObscured: true,
                              controller: vm.passwordController),
                          if (!vm.isPasswordValid) ...[
                            const SizedBox(height: 8.0),
                            Text(vm.passwordErrorMessage,
                                style: GoogleFonts.roboto(
                                    fontSize: 14.0, color: Colors.red))
                          ],
                          const SizedBox(height: 32.0),
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 20.0,
                            children: [
                              InkWell(
                                onTap: () {
                                  vm.loginWithEmail().then((appuser) {
                                    if (appuser != null) {
                                      if (appuser.cafeId == "TBD") {
                                        GoRouter.of(context).pushReplacement(
                                            AppRoutes.partnerWithUs.path);
                                        return;
                                      }

                                      GoRouter.of(context).pushReplacement(
                                          AppRoutes.dashboardPage.path);
                                    }
                                  });
                                },
                                child: StackedContainer(
                                  height: 48.0,
                                  width: 220.0,
                                  containerSpacing: 4.0,
                                  fillColor: Colors.amber,
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.roboto(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  GoRouter.of(context).pushReplacement(
                                      AppRoutes.signupPage.path);
                                },
                                child: Container(
                                    width: 300,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Don't have an account? Sign-up now!",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16, color: Colors.white),
                                    )),
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
                          InkWell(
                            onTap: () {
                              vm.signUpWithGoogle().then((appuser) {
                                if (appuser != null) {
                                  if (appuser.cafeId == "TBD") {
                                    GoRouter.of(context).pushReplacement(
                                        AppRoutes.partnerWithUs.path);
                                    return;
                                  }

                                  GoRouter.of(context).pushReplacement(
                                      AppRoutes.dashboardPage.path);
                                }
                              });
                            },
                            child: StackedContainer(
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
                            ),
                          )
                        ],
                      );
                    })),
                  )
                ],
              )),
    );
  }
}
