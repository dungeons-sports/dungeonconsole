import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/pages/Dashboard/vm.dashboard.dart';
import 'package:dungeonconsole/widgets/widget.borderDropdown.dart';
import 'package:flutter/material.dart';

class FormUpdateStreaming extends StatelessWidget {
  final VMDashboard dashvm;
  const FormUpdateStreaming({super.key, required this.dashvm});

  @override
  Widget build(BuildContext context) {
     List<String> psList = dashvm.listedConsoles
        .where((element) => element.type == ConsoleCategory.streaming)
        .map((e) => e.name)
        .toList();
    return Center(
      child: BorderDropDown(
        items: psList,
        labelText: "Select Streaming",
        onChanged: (val) {},
      ),
    );
  }
}
