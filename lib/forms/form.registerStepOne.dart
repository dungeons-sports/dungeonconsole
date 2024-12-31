import 'package:dungeonconsole/pages/PartnerWithUs/vm.partnerWithUs.dart';
import 'package:dungeonconsole/widgets/widget.borderDropdown.dart';
import 'package:dungeonconsole/widgets/widget.borderTextField.dart';
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
