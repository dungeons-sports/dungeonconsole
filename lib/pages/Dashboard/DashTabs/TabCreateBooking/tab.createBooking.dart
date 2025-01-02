import 'package:dungeonconsole/pages/Dashboard/DashTabs/TabCreateBooking/vm.createBooking.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:dungeonconsole/widgets/widget.borderDropdown.dart';
import 'package:dungeonconsole/widgets/widget.categoryTabs.dart';
import 'package:dungeonconsole/widgets/widget.stackContainer.dart';
import 'package:dungeonconsole/widgets/widget.timeSelectorButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateBookingTab extends StatelessWidget {
  final VMDashboard dashvm;
  const CreateBookingTab({super.key, required this.dashvm});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => VMCreateBooking(),
      builder: (context, child) {
        return Container(
        color: Colors.grey[900],
        padding: const EdgeInsets.all(18.0),
        child: Consumer<VMCreateBooking>(builder: (context, vm, details) {
          if (vm.showBookingCompleteDialog) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Booking Created",
                          style: GoogleFonts.pixelifySans(
                            fontSize: 24.0,
                            color: Colors.white,
                          )),
                      content: Text(
                        "Booking has been created successfully",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.grey[350],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Ok"),
                        )
                      ],
                    );
                  },);
            });
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Booking',
                style: GoogleFonts.roboto(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              Text(
                'Create booking for offline visiting player',
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              const SizedBox(height: 24.0),
              Container(
                height: 2.0,
                width: size.width - 350,
                color: Colors.white,
              ),
              const SizedBox(height: 24.0),
              Text("Select Console type",
                  style: GoogleFonts.roboto(fontSize: 18.0)),
              const SizedBox(height: 8.0),
              CategotyTabWidget(
                availableCategories: dashvm.availableCategories,
                onChanged: (index) {
                  vm.setSelectedCategory(index);
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              Wrap(
                runSpacing: 12.0,
                spacing: 12.0,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TimeSelectorButton(
                        height: 56.0,
                        labelText: "Select Start Time",
                        onTimeSelect: (time) {
                          vm.updateSelectedStartTime(time);
                        },
                      ),
                      const SizedBox(height: 8.0),
                      const Text('Defaults to now'),
                    ],
                  ),
                  BorderDropDown(
                    items: vm.hoursList,
                    labelText: "Select hours",
                    onChanged: (val) {
                      vm.updateDuration(val);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              InkWell(
                onTap: () {
                  vm.createBooking(
                    dashvm.cafeDetails!.id,
                  );
                },
                child: StackedContainer(
                  height: 48.0,
                  width: 220.0,
                  containerSpacing: 4.0,
                  fillColor: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      "Create Booking",
                      style: GoogleFonts.roboto(
                          fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                ),
              )
            ],
          );
        }));
      },
    );
  }
}
