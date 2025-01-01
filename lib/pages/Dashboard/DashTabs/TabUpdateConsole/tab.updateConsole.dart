import 'package:dungeonconsole/forms/DashboardForms/form.updatePC.dart';
import 'package:dungeonconsole/forms/DashboardForms/form.updatePS.dart';
import 'package:dungeonconsole/forms/DashboardForms/form.updateSimRacing.dart';
import 'package:dungeonconsole/forms/DashboardForms/form.updateStreaming.dart';
import 'package:dungeonconsole/forms/DashboardForms/form.updateVR.dart';
import 'package:dungeonconsole/forms/DashboardForms/form.updateXbox.dart';
import 'package:dungeonconsole/pages/Dashboard/DashTabs/TabUpdateConsole/vm.updateConsole.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:dungeonconsole/widgets/widget.categoryTabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateConsoleTab extends StatelessWidget {
  final VMDashboard dashvm;
  const UpdateConsoleTab({super.key, required this.dashvm});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.grey[900],
        padding: const EdgeInsets.all(18.0),
        child: Consumer<VMUpdateConsole>(
          builder: (context, vm, details) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Update Consoles and PCs',
                  style: GoogleFonts.roboto(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12.0),
                Text(
                  'Update information about the devices. (Shown on app listing)',
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
                const SizedBox(height: 24.0),
                Container(
                  height: 2.0,
                  width: size.width - 350,
                  color: Colors.white,
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Select Device Category',
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
                const SizedBox(height: 16.0),
                CategotyTabWidget(
                  onChanged: (index) {
                    vm.selectedTabIndex = index;
                  },
                ),
                const SizedBox(height: 16.0),
                if (vm.selectedTabIndex == 0) SizedBox(
                  height: size.height * 0.7,
                  child: FormUpdatePC(dashvm: dashvm)),
                if (vm.selectedTabIndex == 1) FormUpdatePS(dashvm: dashvm),
                if (vm.selectedTabIndex == 2) FormUpdateXbox(dashvm: dashvm),
                if (vm.selectedTabIndex == 3) FormUpdateVR(dashvm: dashvm),
                if (vm.selectedTabIndex == 4) FormUpdateStreaming(dashvm: dashvm),
                if (vm.selectedTabIndex == 5) FormUpdateSimRacing(dashvm: dashvm),
              ],
            );
          },
        ));
  }
}
