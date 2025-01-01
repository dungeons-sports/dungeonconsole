import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:dungeonconsole/widgets/widget.borderDropdown.dart';
import 'package:dungeonconsole/widgets/widget.borderTextField.dart';
import 'package:dungeonconsole/widgets/widget.stackContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormUpdatePC extends StatelessWidget {
  final VMDashboard dashvm;
  const FormUpdatePC({super.key, required this.dashvm});

  @override
  Widget build(BuildContext context) {
    List<String> pcList = dashvm.listedConsoles
        .where((element) => element.type == ConsoleCategory.pc)
        .map((e) => e.name)
        .toList();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BorderDropDown(
                items: pcList,
                labelText: "Select PCs",
                onChanged: (val) {},
              ),
              const SizedBox(
                width: 16.0,
              ),
              Checkbox(value: false, onChanged: (val){}),
              Text("Check to apply same specifications to all PCs", style: GoogleFonts.roboto(fontSize: 16.0, color: Colors.white),)
            ],
          ),

          // Name.
          const SizedBox(height: 24.0),
          Text(
            "Name of PC",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "System One or PC1",
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          // GPU.
          Text(
            "GPU",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "Nvidia RTX 3090",
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          // CPU.
          Text(
            "CPU",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "Intel i9-10900K",
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          // RAM.
          Text(
            "RAM",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "32GB DDR4",
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          // RAM-Type.
          Text(
            "RAM Type",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "DDR4",
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          // Storage.
          Text(
            "Storage",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "1TB NVMe SSD",
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          // Games.
          Text(
            "Games",
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BorderedTextField(
            hintText: "CS:GO, Valorant, Apex Legends",
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          InkWell(
            onTap: () {},
            child: StackedContainer(
              height: 48.0,
              width: 220.0,
              containerSpacing: 4.0,
              fillColor: Colors.greenAccent,
              child: Center(
                child: Text(
                  "Create Booking",
                  style:
                      GoogleFonts.roboto(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
