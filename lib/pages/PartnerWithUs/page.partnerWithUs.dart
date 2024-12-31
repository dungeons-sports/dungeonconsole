import 'package:dungeonconsole/forms/form.registerStepOne.dart';
import 'package:dungeonconsole/forms/form.registerStepThree.dart';
import 'package:dungeonconsole/forms/form.registerStepTwo.dart';
import 'package:dungeonconsole/helpers/helper.navigationRoutes.dart';
import 'package:dungeonconsole/pages/PartnerWithUs/vm.partnerWithUs.dart';
import 'package:dungeonconsole/widgets/widget.stackContainer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PartnerWithUsPage extends StatelessWidget {
  const PartnerWithUsPage({super.key});

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
          : Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width > 600 ? 48.0 : 12.0, vertical: 24),
        child: Center(
          child: Row(
            children: [
              if (size.width > 600)
                SizedBox(
                  height: size.height,
                  child: Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      'assets/images/dragon.png',
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                    ),
                  ),
                ),
              if (size.width > 600) const Spacer(),
              Consumer<VMPartnerWithUs>(
                builder: (context, vm, index) {
                  vm.fetchRequiredDetails().then((isLoggedIn) {
                    if (!isLoggedIn) {
                      GoRouter.of(context)
                          .pushReplacement(AppRoutes.loginPage.path);
                    }

                    if(vm.currentStep == -1){
                      GoRouter.of(context)
                          .pushReplacement(AppRoutes.dashboardPage.path);
                    }
                  });

                  return StackedContainer(
                      width: size.width > 600
                          ? size.width * 0.6
                          : size.width * 0.9,
                      height: size.height,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width > 600 ? 18.0 : 8.0,
                          vertical: size.width > 600 ? 28.0 : 8.0),
                      child: SizedBox(
                        height: size.height,
                        child: Stepper(
                          currentStep: vm.currentStep,
                          onStepContinue: vm.nextStep,
                          onStepCancel: vm.previousStep,
                          type: StepperType.vertical,
                          steps: [
                            Step(
                              title: const Text('Basic Details'),
                              content: SizedBox(
                                  width: size.width * 0.6,
                                  child: RegisterStepOne(vm: vm)),
                            ),
                            Step(
                              title: const Text('Pricing & Inventory'),
                              content: SizedBox(
                                  width: size.width * 0.6,
                                  child: RegisterStepTwo(vm: vm)),
                            ),
                            Step(
                                title: const Text('Additional Details'),
                                content: SizedBox(
                                  width: size.width * 0.6,
                                  child: RegisterStepThree(vm: vm),
                                ))
                          ],
                          controlsBuilder: (context, details) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {
                                    print(vm.currentStep);
                                    if (vm.currentStep == 0) {
                                      vm.submit();
                                    }

                                    if (vm.currentStep == 1) {
                                      vm.submitInventoryInfo();
                                    }

                                    if (vm.currentStep == 2) {
                                      vm.submitFinal();
                                      GoRouter.of(context).pushReplacement(AppRoutes.dashboardPage.path);
                                    }

                                    vm.nextStep();
                                  },
                                  child: StackedContainer(
                                    height: 48.0,
                                    width: 180.0,
                                    containerSpacing: 4.0,
                                    fillColor: const Color.fromARGB(
                                        255, 237, 132, 255),
                                    child: !vm.isLoading
                                        ? Center(
                                            child: Text(
                                              vm.currentStep < 2
                                                  ? "Next"
                                                  : "Finish",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18.0,
                                                  color: Colors.black),
                                            ),
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator
                                                .adaptive(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Colors.black),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
