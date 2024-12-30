import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/pages/PartnerWithUs/vm.partnerWithUs.dart';
import 'package:dungeonconsole/widgets/widget.borderDropdown.dart';
import 'package:dungeonconsole/widgets/widget.borderTextField.dart';
import 'package:dungeonconsole/widgets/widget.selectableChip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterStepOne extends StatelessWidget {
  final VMPartnerWithUs vm;
  const RegisterStepOne({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Partner with us.",
          style: GoogleFonts.pixelifySans(fontSize: 36),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 42.0),
          child: Text(
            "Let's get you listed, shall we?",
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
        Text(
          "Name of place",
          style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
        ),
        const SizedBox(
          height: 8.0,
        ),
        BorderedTextField(
          hintText: "Full name of the cafe",
          controller: vm.cafeNameController,
        ),
        const SizedBox(
          height: 16.0,
        ),

        // City and state.
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            BorderDropDown(
              labelText: 'Select City',
              onChanged: (value) {
                vm.city = value;
              },
              items: vm.cities,
            ),
            const SizedBox(width: 20.0),
            BorderDropDown(
              labelText: 'Select State',
              onChanged: (value) {
                vm.state = value;
              },
              items: vm.states,
            ),
          ],
        ),

        const SizedBox(
          height: 16.0,
        ),
        Text(
          "Devices Installed (You can select multiple)",
          style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Wrap(
          runSpacing: 12.0,
          spacing: 12.0,
          children: [
            SelectableChip(
              onSelect: (value) {
                if (!value) {
                  vm.removeConsole('PC', ConsoleType.pc);
                  return;
                }
                vm.addConsole(
                  consoleId: 'PC',
                  type: ConsoleType.pc,
                  allowMultiplayer: false,
                  perHourPrice: 10.0,
                  tsCreated: DateTime.now().toUtc().toString(),
                  tsUpdated: DateTime.now().toUtc().toString(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/monitor.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("PC")
                ],
              ),
            ),
            SelectableChip(
              onSelect: (value) {
                if (!value) {
                  vm.removeConsole('PS', ConsoleType.ps);
                  return;
                }
                vm.addConsole(
                  consoleId: 'PS',
                  type: ConsoleType.ps,
                  allowMultiplayer: true,
                  perHourPrice: 10.0,
                  tsCreated: DateTime.now().toUtc().toString(),
                  tsUpdated: DateTime.now().toUtc().toString(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/playstation-logotype.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("PS")
                ],
              ),
            ),
            SelectableChip(
              onSelect: (value) {
                if (!value) {
                  vm.removeConsole('XBOX', ConsoleType.xbox);
                  return;
                }
                vm.addConsole(
                  consoleId: 'XBOX',
                  type: ConsoleType.xbox,
                  allowMultiplayer: true,
                  perHourPrice: 10.0,
                  tsCreated: DateTime.now().toUtc().toString(),
                  tsUpdated: DateTime.now().toUtc().toString(),
                );
              },
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/xbox-logo.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("XBox")
                ],
              ),
            ),
            SelectableChip(
              onSelect: (value) {
                if (!value) {
                  vm.removeConsole('VR', ConsoleType.vr);
                  return;
                }
                vm.addConsole(
                  consoleId: 'VR',
                  type: ConsoleType.vr,
                  allowMultiplayer: false,
                  perHourPrice: 10.0,
                  tsCreated: DateTime.now().toUtc().toString(),
                  tsUpdated: DateTime.now().toUtc().toString(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/virtual-reality-glasses.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("VR")
                ],
              ),
            ),
            SelectableChip(
              onSelect: (value) {
                if (!value) {
                  vm.removeConsole('STREAMING', ConsoleType.streaming);
                  return;
                }
                vm.addConsole(
                  consoleId: 'STREAMING',
                  type: ConsoleType.streaming,
                  allowMultiplayer: false,
                  perHourPrice: 10.0,
                  tsCreated: DateTime.now().toUtc().toString(),
                  tsUpdated: DateTime.now().toUtc().toString(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(width: 10.0),
                  const Text("Streaming")
                ],
              ),
            ),
            SelectableChip(
              onSelect: (value) {
                if (!value) {
                  vm.removeConsole('SIMRACING', ConsoleType.simRacing);
                  return;
                }
                vm.addConsole(
                  consoleId: 'SIMRACING',
                  type: ConsoleType.simRacing,
                  allowMultiplayer: false,
                  perHourPrice: 10.0,
                  tsCreated: DateTime.now().toUtc().toString(),
                  tsUpdated: DateTime.now().toUtc().toString(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/fast.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("Sim Racing")
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          "Name of the owner",
          style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
        ),
        const SizedBox(
          height: 8.0,
        ),
        BorderedTextField(
          hintText: "Owner's name",
          controller: vm.ownerNameController,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          "Contact details",
          style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
        ),
        const SizedBox(
          height: 8.0,
        ),
        BorderedTextField(
          hintText: "Phone number",
          controller: vm.ownerPhoneController,
        ),

        // END
        const SizedBox(
          height: 32.0,
        ),
      ],
    );
  }
}
