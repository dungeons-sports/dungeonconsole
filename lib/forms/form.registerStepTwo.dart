import 'package:dungeonconsole/pages/PartnerWithUs/vm.partnerWithUs.dart';
import 'package:dungeonconsole/widgets/widget.borderTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterStepTwo extends StatelessWidget {
  final VMPartnerWithUs vm;
  const RegisterStepTwo({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Inventory Info",
          style: GoogleFonts.pixelifySans(fontSize: 36),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 42.0),
          child: Text(
            "These details are required for allowing online booking.",
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
        if (vm.isPCAvailable) ...[
          Text(
            "How many PC systems do you have?",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
              hintText: "Number of PCs", controller: vm.getPcCountController),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "How much do you charge for 1 Hour?",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
              hintText: "Amount per Hour",
              controller: vm.getPcAmountController),
          const SizedBox(
            height: 16.0,
          ),
        ],
        if (vm.isPSConsoleAvailable) ...[
          Text(
            "How many play-stations do you have?",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
              hintText: "Number of play-stations",
              controller: vm.psCountController),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "How much do you charge for 1 Hour?",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "Amount per Hour",
            controller: vm.psAmountController,
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
        if (vm.isXboxAvailable) ...[
          Text(
            "How many Xbox do you have?",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "Number of Xboxes",
            controller: vm.xboxCountController,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "How much do you charge for 1 Hour?",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "Amount per Hour",
            controller: vm.xboxAmountController,
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
        if (vm.isSimRacingAvailable) ...[
          Text(
            "How many simulation sets do you have?",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "Number of simulation sets",
            controller: vm.simRacingCountController,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "How much do you charge for 1 Hour?",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "Amount per Hour",
            controller: vm.simRacingAmountController,
          ),
        ],
        const SizedBox(
          height: 32.0,
        ),
      ],
    );
  }
}
