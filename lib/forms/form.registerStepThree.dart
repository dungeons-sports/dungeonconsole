import 'package:dungeonconsole/pages/PartnerWithUs/vm.partnerWithUs.dart';
import 'package:dungeonconsole/widgets/widget.borderDropdown.dart';
import 'package:dungeonconsole/widgets/widget.borderTextField.dart';
import 'package:dungeonconsole/widgets/widget.timeSelectorButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterStepThree extends StatelessWidget {
  final VMPartnerWithUs vm;
  const RegisterStepThree({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Google Maps",
          style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
        ),
        const SizedBox(
          height: 8.0,
        ),
        BorderedTextField(
            hintText: "Google Maps Location",
            controller: vm.getGoogleMapsController),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          "Top Games (Separate with , )",
          style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
        ),
        const SizedBox(
          height: 8.0,
        ),
        BorderedTextField(
            hintText: "Valorant, FIFA ...",
            controller: vm.getTopGamesController),
        const SizedBox(
          height: 16.0,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            BorderDropDown(
              items: vm.yn,
              labelText: "Gaming Chair?",
              onChanged: (value) {
                if (value == "Yes") {
                  vm.isGamingChair = true;
                } else {
                  vm.isGamingChair = false;
                }
              },
            ),
            BorderDropDown(
              items: vm.yn,
              labelText: "Washrooms?",
              onChanged: (value) {
                if (value == "Yes") {
                  vm.isWashroom = true;
                } else {
                  vm.isWashroom = false;
                }
              },
            ),
            BorderDropDown(
              items: vm.yn,
              labelText: "Air-Conditioning?",
              onChanged: (value) {
                if (value == "Yes") {
                  vm.isAC = true;
                } else {
                  vm.isAC = false;
                }
              },
            ),
            BorderDropDown(
              items: vm.yn,
              labelText: "Parking?",
              onChanged: (value) {
                if (value == "Yes") {
                  vm.isParking = true;
                } else {
                  vm.isParking = false;
                }
              },
            ),
            BorderDropDown(
              items: vm.yn,
              labelText: "Food Allowed?",
              onChanged: (value) {
                if (value == "Yes") {
                  vm.isFoodAllowed = true;
                } else {
                  vm.isFoodAllowed = false;
                }
              },
            ),
            BorderDropDown(
              items: vm.yn,
              labelText: "Always Open?",
              onChanged: (value) {
                if (value == "Yes") {
                  vm.isAlwaysOpen = true;
                } else {
                  vm.isAlwaysOpen = false;
                }
              },
            ),
            BorderDropDown(
              items: vm.yn,
              labelText: "Smoking Allowed?",
              onChanged: (value) {
                if (value == "Yes") {
                  vm.isSmokingAllowed = true;
                } else {
                  vm.isSmokingAllowed = false;
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        if (!vm.isAlwaysOpen) ...[
          Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            children: [
              TimeSelectorButton(
                  labelText: "Opening time", onTimeSelect: (time) {}),
              TimeSelectorButton(
                  labelText: "Closing time", onTimeSelect: (time) {}),
            ],
          ),
        ],
        const SizedBox(
          height: 32.0,
        ),
      ],
    );
  }
}
