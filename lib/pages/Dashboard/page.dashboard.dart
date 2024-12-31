import 'package:dungeonconsole/helpers/helper.navigationRoutes.dart';
import 'package:dungeonconsole/pages/Dashboard/DashTabs/tab.createBooking.dart';
import 'package:dungeonconsole/pages/Dashboard/DashTabs/tab.viewBooking.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: size.width < 600 || size.height < 500
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/cat.png',
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: Text(
                      "Managing is not supported on Mobile Devices\nSwitch to Desktop",
                      style: GoogleFonts.pixelifySans(fontSize: 16),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ))
            : Consumer<VMDashboard>(builder: (context, vm, detail) {
                vm.fetchCafeDetails().then((success){
                  if(!success){
                    GoRouter.of(context).pushReplacement(AppRoutes.loginPage.path);
                  }
                });
                return Row(
                  children: [
                    Container(
                      width: 300,
                      color: Colors.grey[900],
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/app_icon.png',
                                width: 80,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dungeon Console",
                                    style: GoogleFonts.roboto(fontSize: 12),
                                  ),
                                  Text(
                                    "Domin8 ESports",
                                    style:
                                        GoogleFonts.pixelifySans(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          ListTile(
                            title: const Text("Create booking"),
                            subtitle: const Text(
                              "Create booking for offline customers",
                            ),
                            contentPadding: const EdgeInsets.all(0.0),
                            onTap: () {
                              vm.currentTab = 0;
                            },
                          ),
                          ListTile(
                            title: const Text("Upcoming Booking"),
                            subtitle: const Text(
                              "View curated booking for today",
                            ),
                            contentPadding: const EdgeInsets.all(0.0),
                            onTap: () {
                              vm.currentTab = 1;
                            },
                          ),
                          ListTile(
                            title: const Text("View Booking"),
                            subtitle: const Text(
                              "View past, present and future booking",
                            ),
                            contentPadding: const EdgeInsets.all(0.0),
                            onTap: () {
                               vm.currentTab = 2;
                            },
                          ),
                          ListTile(
                            title: const Text("Settings"),
                            subtitle: const Text(
                              "Manage and update listing information",
                            ),
                            contentPadding: const EdgeInsets.all(0.0),
                            onTap: () {
                               vm.currentTab = 3;
                            },
                          ),
                        ],
                      ),
                    ),
                    if(vm.currentTab == 0)
                      const CreateBookingTab(),
                    
                    if(vm.currentTab == 1)
                      const ViewBookingTab()

                  ],
                );
              }));
  }
}
