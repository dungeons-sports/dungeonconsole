import 'package:dungeonconsole/forms/form.registerStepOne.dart';
import 'package:dungeonconsole/forms/form.registerStepThree.dart';
import 'package:dungeonconsole/forms/form.registerStepTwo.dart';
import 'package:dungeonconsole/helpers/helper.sizes.dart';
import 'package:dungeonconsole/pages/PartnerWithUs/vm.partnerWithUs.dart';
import 'package:dungeonconsole/widgets/widget.stackContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PartnerWithUsPage extends StatelessWidget {
  const PartnerWithUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Device device = BreakpointHelper.device(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24),
        child: Center(
          child: Row(
            children: [
              if (device == Device.desktop)
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
              if (device == Device.desktop) const Spacer(),
              Consumer<VMPartnerWithUs>(
                builder: (context, vm, index) {
                  return StackedContainer(
                      width: device == Device.desktop
                          ? size.width * 0.6
                          : size.width * 0.8,
                      height: size.height,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 28.0),
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
                                  width: size.width*0.6,
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
                                    if (vm.currentStep == 0) {
                                      vm.submit();
                                    }
                                
                                    if (vm.currentStep == 1) {
                                      vm.submitInventoryInfo();
                                    }

                                    if (vm.currentStep == 2) {
                                      vm.submitFinal();
                                    }
                                
                                    vm.nextStep();
                                  },
                                  child: StackedContainer(
                                    height: 48.0,
                                    width: 180.0,
                                    containerSpacing: 4.0,
                                    fillColor: const Color.fromARGB(
                                        255, 237, 132, 255),
                                    child: Center(
                                      child: Text(
                                        vm.currentStep<2? "Next" : "Finish",
                                        style: GoogleFonts.roboto(
                                            fontSize: 18.0,
                                            color: Colors.black),
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
