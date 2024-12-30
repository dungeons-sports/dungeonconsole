import 'package:dungeonconsole/helpers/helper.navigationRoutes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class NavigationService {
  void gotoPage(AppRoutes route, BuildContext context, {bool replacement = false});
}

class NavigationServiceImpl extends NavigationService {
  @override
  void gotoPage(AppRoutes route, BuildContext context, {bool replacement = false}) {
    if(replacement){
      context.pushReplacement(route.path);
      return;
    }
    context.go(route.path);
  }
}