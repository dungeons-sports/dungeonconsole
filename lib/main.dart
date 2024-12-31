import 'package:dungeonconsole/helpers/helper.navigationRoutes.dart';
import 'package:dungeonconsole/pages/Authentication/Login/vm.login.dart';
import 'package:dungeonconsole/pages/Authentication/SignUp/vm.signup.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:dungeonconsole/pages/PartnerWithUs/vm.partnerWithUs.dart';
import 'package:dungeonconsole/services/service.authentication.dart';
import 'package:dungeonconsole/services/service.firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final locator = GetIt.asNewInstance();

void setupServices() {
  locator.registerSingleton<AuthenticationService>(AuthenticationServiceImpl());
  locator.registerSingleton<FirestoreService>(FirestoreServiceImpl());
}

void main() async {
  usePathUrlStrategy();
  setupServices();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VMDashboard()),
        ChangeNotifierProvider(create: (_) => VMPartnerWithUs()),
        ChangeNotifierProvider(create: (_) => VMSignup()),
        ChangeNotifierProvider(create: (_) => VMLogin()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black),
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child!,
        );
      },
      routerConfig: NavigationRoutes.routes,
    );
  }
}
