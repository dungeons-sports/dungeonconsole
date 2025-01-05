import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/pages/Dashboard/DashTabs/TabFlowBooking/vm.sessionManager.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:dungeonconsole/widgets/widget.categoryTabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessionManagerTab extends StatelessWidget {
  final VMDashboard dashvm;

  const SessionManagerTab({super.key, required this.dashvm});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => VMSessionManager(cafeId: dashvm.cafeDetails!.id),
      builder: (context, child) {
        final vm = Provider.of<VMSessionManager>(context);

        if (vm.showBookingCompleteDialog) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Booking Summary",
                    style: GoogleFonts.pixelifySans(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                  content: Text(
                    "Booking completed successfully.",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.grey[350],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        vm.clearDialog();
                      },
                      child: const Text("Ok"),
                    )
                  ],
                );
              },
            );
          });
        }

        return Container(
          color: Colors.grey[900],
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Time Manager',
                style: GoogleFonts.roboto(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              Text(
                'Start and stop time for the console',
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
                preSelected: vm.selectedCategory,
                availableCategories: dashvm.availableCategories,
                onChanged: (index) {
                  vm.setSelectedCategory(ConsoleCategory.values[index]);
                },
              ),
              const SizedBox(height: 24.0),
              LayoutBuilder(
                builder: (builder, constraints) {
                  final columnWidth = constraints.maxWidth / 5;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 0,
                      columns: [
                        DataColumn(
                          label: SizedBox(
                            width: columnWidth,
                            child: Text(
                              'Console ID',
                              style: GoogleFonts.roboto(fontSize: 16.0),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: columnWidth,
                            child: Text(
                              'Progress Time',
                              style: GoogleFonts.roboto(fontSize: 16.0),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: columnWidth,
                            child: Text(
                              'Start',
                              style: GoogleFonts.roboto(fontSize: 16.0),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: columnWidth,
                            child: Text(
                              'Stop',
                              style: GoogleFonts.roboto(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                      rows: dashvm.listedConsoles.map((console) {
                        final progressTime =
                            vm.getProgressTime(console.consoleId);

                        return DataRow(
                          cells: [
                            DataCell(
                              SizedBox(
                                width: columnWidth,
                                child: Text(console.name.toUpperCase()),
                              ),
                            ),
                            DataCell(
                              SizedBox(
                                width: columnWidth,
                                child: Text(
                                  "${progressTime.inHours}:${(progressTime.inMinutes % 60).toString().padLeft(2, '0')}:${(progressTime.inSeconds % 60).toString().padLeft(2, '0')}",
                                ),
                              ),
                            ),
                            DataCell(
                              SizedBox(
                                  width: columnWidth,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          if (!vm.checkCosoleStatus(
                                              console.consoleId)) {
                                            vm.startTimer(console.consoleId);
                                          }
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: !(vm.checkCosoleStatus(
                                                    console.consoleId))
                                                ? Border.all(
                                                    color: Colors.green)
                                                : Border.all(
                                                    color: Colors.grey),
                                          ),
                                          child: Text(
                                            "START",
                                            style: TextStyle(
                                                color: !(vm.checkCosoleStatus(
                                                        console.consoleId))
                                                    ? Colors.green
                                                    : Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            DataCell(
                              SizedBox(
                                  width: columnWidth,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          vm.stopTimer(console.consoleId);
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.red),
                                          ),
                                          child: const Text(
                                            "STOP",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
