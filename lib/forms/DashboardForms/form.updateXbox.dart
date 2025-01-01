import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:dungeonconsole/widgets/widget.borderDropdown.dart';
import 'package:flutter/material.dart';

class FormUpdateXbox extends StatelessWidget {
  final VMDashboard dashvm;
  const FormUpdateXbox({super.key, required this.dashvm});

  @override
  Widget build(BuildContext context) {
     List<String> psList = dashvm.listedConsoles
        .where((element) => element.type == ConsoleCategory.xbox)
        .map((e) => e.name)
        .toList();
    return Center(
      child: BorderDropDown(
        items: psList,
        labelText: "Select Xbox",
        onChanged: (val) {},
      ),
    );
  }
}
