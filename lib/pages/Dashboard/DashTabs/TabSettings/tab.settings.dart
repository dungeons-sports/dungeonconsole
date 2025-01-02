import 'package:dungeonconsole/pages/Dashboard/DashTabs/TabSettings/vm.settings.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:dungeonconsole/widgets/widget.borderDropdown.dart';
import 'package:dungeonconsole/widgets/widget.borderTextField.dart';
import 'package:dungeonconsole/widgets/widget.stackContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  final VMDashboard dashvm;
  const SettingsTab({super.key, required this.dashvm});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => VMSettings(dashvm.cafeDetails),
      builder: (context, child) {
        return Container(
          color: Colors.grey[900],
          padding: const EdgeInsets.all(18.0),
          child: Consumer<VMSettings>(builder: (context, vm, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: GoogleFonts.roboto(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'Update listing information',
                    style: GoogleFonts.roboto(fontSize: 20),
                  ),
                  const SizedBox(height: 24.0),
                  Container(
                    height: 2.0,
                    width: size.width - 350,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24.0),
                  // Booking list.
                  _buildInfoRow(
                      'Owner Name', dashvm.cafeDetails?.ownerName ?? ""),
                  _buildInfoRow(
                      'Owner Phone', dashvm.cafeDetails?.ownerPhone ?? ""),
                  _buildInfoRow(
                      'Cafe Name', dashvm.cafeDetails?.cafeName ?? ""),
                  _buildInfoRow('City', dashvm.cafeDetails?.city ?? ""),
                  _buildInfoRow(
                      'Open Time (UTC)', dashvm.cafeDetails?.openTimeUTC ?? ""),
                  _buildInfoRow('Close Time (UTC)',
                      dashvm.cafeDetails?.closeTimeUTC ?? ""),
                  _buildInfoRow('Google Maps Link',
                      dashvm.cafeDetails?.googleMapsLink ?? ""),
                  _buildInfoRow('Verified',
                      dashvm.cafeDetails?.isVerified ?? false ? 'Yes' : 'No'),
                  const SizedBox(height: 24.0),
                  Container(
                    width: double.maxFinite,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24.0),
                  _buildEditableRow(
                      hintText: "Valorant, FIFA, etc",
                      title: 'Top Games',
                      value: dashvm.cafeDetails?.topGames ?? "",
                      controller: TextEditingController()),
                  _buildSelectableRow(
                      items: ["Yes", "No"],
                      selectedValue: dashvm.cafeDetails?.isGamingChair ?? false
                          ? 'Yes'
                          : 'No',
                      labelText: 'Gaming Chairs',
                      onChanged: (val) {}),
                  _buildSelectableRow(
                      items: ["Yes", "No"],
                      selectedValue: dashvm.cafeDetails?.isWashroom ?? false
                          ? 'Yes'
                          : 'No',
                      labelText: 'Washroom Available',
                      onChanged: (val) {}),
                  _buildSelectableRow(
                      items: ["Yes", "No"],
                      selectedValue:
                          dashvm.cafeDetails?.isAC ?? false ? 'Yes' : 'No',
                      labelText: 'Air Conditioned',
                      onChanged: (val) {}),
                  _buildSelectableRow(
                      items: ["Yes", "No"],
                      selectedValue:
                          dashvm.cafeDetails?.isParking ?? false ? 'Yes' : 'No',
                      labelText: 'Parking Available',
                      onChanged: (val) {}),
                  _buildSelectableRow(
                      items: ["Yes", "No"],
                      selectedValue: dashvm.cafeDetails?.isFoodAllowed ?? false
                          ? 'Yes'
                          : 'No',
                      labelText: 'Food Allowed',
                      onChanged: (val) {}),
                  _buildSelectableRow(
                      items: ["Yes", "No"],
                      selectedValue: dashvm.cafeDetails?.isAlwaysOpen ?? false
                          ? 'Yes'
                          : 'No',
                      labelText: 'Always Open',
                      onChanged: (val) {}),
                  _buildSelectableRow(
                      items: ["Yes", "No"],
                      selectedValue:
                          dashvm.cafeDetails?.isSmokingAllowed ?? false
                              ? 'Yes'
                              : 'No',
                      labelText: 'Smoking Allowed',
                      onChanged: (val) {}),
                  const SizedBox(height: 24.0),
                  Container(
                    width: double.maxFinite,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24.0),
                  InkWell(
                    onTap: () {
                      vm.updateCafeListValues();
                    },
                    child: StackedContainer(
                      height: 48.0,
                      width: 220.0,
                      containerSpacing: 4.0,
                      fillColor: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          "Update Listing",
                          style: GoogleFonts.roboto(
                              fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableRow(
      {required String hintText,
      required String title,
      required String value,
      required TextEditingController controller}) {
    controller.text = value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child: BorderedTextField(
                  hintText: hintText, controller: controller)),
        ],
      ),
    );
  }

  Widget _buildSelectableRow(
      {required String labelText,
      required List<String> items,
      required String selectedValue,
      required Function(String) onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              labelText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: BorderDropDown(
              items: items,
              labelText: "",
              initialValue: selectedValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
